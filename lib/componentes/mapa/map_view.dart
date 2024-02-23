import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meu_app/componentes/chamados/chamados.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_tempo.dart';
import '../api/carPosicao.dart';
import '../api/lixo_posicao.dart';
import '../controllers/map_markers.dart';
import '../estilosMapa/componente/Map_style_manager.dart';
import '../estilosMapa/map_style_branco.dart';
import '../hamburguer/gaveta_mapa_hamburguer.dart';
import '../localizacao/LocationTracker.dart';
import '../perfil/ProfilePage.dart';
import '../rotas/rota.dart';
import 'componentes/map_main/modal_mapa.dart';

class MapView extends StatefulWidget {
  final Function() onLogout;
  final void Function(User? user, File? userImage) onUpdate;
  final String userName;
  final String userEmail;
  final String userImageUrl;
  final void Function(File? userImage) updateProfileImageCallback;

  MapView({
    required this.updateProfileImageCallback,
    required this.onLogout,
    required this.onUpdate,
    required this.userName,
    required this.userEmail,
    required this.userImageUrl,
    required userImageURL,
  });

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController googleMapController;
  MapStyleManager? mapStyleManager;
  Set<Marker> markers = {};
  late LatLng busLocation;
  late LocationTracker locationTracker;
  double currentHeading = 0;
  bool followUser = false;
  late Timer centerOnBusTimer;
  Set<Marker> carPositionMarkers = {};
  Set<Polyline> _polylines = {};
  Completer<GoogleMapController> _controller = Completer();
  File? _userImage;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? _user;
  late String userImageUrl;
  late GoogleMapController mapController;
  LatLng _center = const LatLng(-22.8542, -43.7753);
  Set<Marker> _userLocationMarker = {};
  Set<Marker> _manualMarkers = {};
  Set<Polyline> polylines = {};
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isOperationInProgress = false;

  @override
  void initState() {
    super.initState();
    _buscarUsuario();
    locationTracker = LocationTracker();
    locationTracker.startTracking();
    LocationTracker.busLocationStream.listen(_atualizacaoMarcadorDeUsuario);
    userImageUrl = widget.userImageUrl;
    FlutterCompass.events?.listen((CompassEvent? event) {
      if (event != null && event.heading != null && followUser) {
        setState(() {
          currentHeading = event.heading!;
        });
      }
    });

    MapMarkers.getMarkers(context).then((result) {
      // Filtrar os marcadores, mantendo apenas o marcador de geolocalização
      List<Marker> filteredMarkers = result
          .where((marker) => marker.markerId.value == 'busLocation')
          .toList();

      setState(() {
        markers = filteredMarkers
            .toSet(); // Converte a lista filtrada de volta para um conjunto de marcadores
      });
    });

    centerOnBusTimer = Timer.periodic(Duration(minutes: 1), (Timer timer) {
      _centralizarUsuario();
    });

    _controller = Completer();
    _controller.future.then((controller) {
      googleMapController = controller;
      mapStyleManager?.setController(googleMapController);
      mapStyleManager?.setMapStyle(MapStyleBranco.getCustomMapStyle());
    });
  }

  Future<void> _buscarUsuario() async {
    _user = _auth.currentUser;
    setState(() async {
      if (_user?.photoURL != null) {
        try {
          // Primeiro, tentamos carregar a imagem do Firebase Storage
          String downloadURL = await firebase_storage.FirebaseStorage.instance
              .ref('profile_images/${_user!.uid}.jpg')
              .getDownloadURL();

          setState(() {
            _userImage = File(downloadURL);
          });

          // Salva a imagem localmente para evitar carregamentos repetidos do Storage
          await _savaImagemUsuario();
        } catch (e) {
          // Se ocorrer um erro ao buscar no Firebase Storage, tentamos carregar localmente
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? imagePath = prefs.getString('userImage');

          if (imagePath != null) {
            setState(() {
              _userImage = File(imagePath);
            });
          } else {
            print('Error fetching image from Firebase Storage: $e');
          }
        }
      }
    });
  }

  Future<void> _savaImagemUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_userImage != null) {
      prefs.setString('userImage', _userImage!.path);
    }
  }

  Future<void> _carregarImagemUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('userImage');

    if (imagePath != null) {
      setState(() {
        _userImage = File(imagePath);
      });
    }
  }

  @override
  void dispose() {
    locationTracker.dispose();
    centerOnBusTimer.cancel();
    mapStyleManager?.dispose();
    super.dispose();
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    mapStyleManager = MapStyleManager(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pushNamed(context, '/home2');
          return false;
        },
        child: Scaffold(
          drawer: GavetaMap(
            onLogout: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            onUpdate: (user, userImage) {
              _openProfilePage();
            },
            onNavigateToSomeRoute: () {
              Navigator.pop(context);
            },
            onNewButtonAction: () {},
            onProfileImageChanged: () {
              widget.updateProfileImageCallback(_userImage);
              _carregarImagemUsuario();
            },
          ),
          body: Builder(
            builder: (context) => Stack(
              children: [
                GoogleMap(
                  onMapCreated: onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-22.8665, -43.7772),
                    zoom: 14,
                  ),
                  markers: {
                    ..._manualMarkers,
                    ..._userLocationMarker,
                    ...carPositionMarkers,
                    ...markers,
                  },
                  polylines: polylines,
                  myLocationEnabled: false,
                  compassEnabled: true,
                  onCameraMove: (CameraPosition position) {
                    // Se o usuário moveu o mapa, desativa o modo de seguir o usuário
                    followUser = false;
                  },
                  onCameraIdle: () {
                    if (followUser) {
                      _girarMapa(currentHeading);
                    }
                  },
                ),
                CustomBottomSheet(
                  onToggleMarkers: _alternarMarcadores,
                  onTogglePolylines: _alternarPolilinhas,
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Hero(
                      tag: 'profile_image',
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            _userImage != null ? FileImage(_userImage!) : null,
                        child: _userImage == null
                            ? Text(
                                _gerarAvatarApartirDonome(widget.userName),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 8),
                      Apitempo(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _alternarMarcadores() async {
    try {
      Set<Marker> markers = await MapMarkers.getMarkers(context);
      Set<Marker> carMarkers = await CarPositionComponentWithoutMap.fetchData();
      setState(() {
        _manualMarkers = {...markers, ...carMarkers};
        polylines = {};
      });
    } catch (error) {
      print("Erro ao alterar marcador: $error");
    }
  }

  Future<void> _alternarPolilinhas() async {
    try {
      Set<Marker> carMarkers =
          await LixoPositionComponentWithoutMap.fetchData();
      setState(() {
        _manualMarkers = {...carMarkers};
        polylines = {
          _criarPolilinhas(Rota.rota1(), Colors.blue),
          _criarPolilinhas(Rota.rota2(), Colors.red),
        };
      });
    } catch (error) {
      print("Erro ao alterar polilinha: $error");
    }
  }

  Polyline _criarPolilinhas(Rota rota, Color color) {
    return Polyline(
      polylineId: PolylineId(rota.nome),
      color: color,
      width: 5,
      points: rota.coordenadas,
    );
  }

  void _atualizacaoMarcadorDeUsuario(LatLng busLocation) async {
    this.busLocation = busLocation;
    // Verifica se o usuário tem uma imagem de perfil
    if (_userImage != null) {
      // Obtém um ícone de usuario com a imagem do perfil do usuário
      final BitmapDescriptor busIcon =
          await _obterIconeDeUsuarioRedimensionado(_userImage!);
      setState(() {
        markers.removeWhere((marker) => marker.markerId.value == 'busLocation');
        markers.add(
          Marker(
            markerId: MarkerId('busLocation'),
            position: busLocation,
            icon: busIcon,
            anchor: Offset(0.5, 0.5),
          ),
        );
      });

      if (followUser) {
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: busLocation,
              bearing: currentHeading,
            ),
          ),
        );
      }
    } else {
      // Se o usuário não tiver uma imagem de perfil, utiliza um ícone padrão
      final BitmapDescriptor defaultBusIcon =
          await _obterIconeDeUsuarioRedimensionadoCominicial(
              _gerarAvatarUsuario());
      setState(() {
        markers.removeWhere((marker) => marker.markerId.value == 'busLocation');
        markers.add(
          Marker(
            markerId: MarkerId('busLocation'),
            position: busLocation,
            icon: defaultBusIcon,
            anchor: Offset(0.5, 0.5),
          ),
        );
      });
      if (followUser) {
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: busLocation,
              bearing: currentHeading,
            ),
          ),
        );
      }
    }
  }

  Future<BitmapDescriptor> _obterIconeDeUsuarioRedimensionado(
      File userImage) async {
    final Uint8List bytes = await userImage.readAsBytes();
    final codec = await instantiateImageCodec(
      bytes,
      targetHeight: 100,
      targetWidth: 100,
    );
    final FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? resizedData =
        await frameInfo.image.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
  }

  Future<BitmapDescriptor> _obterIconeDeUsuarioRedimensionadoCominicial(
      String avatarInitial) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paintCircle = Paint()..color = Colors.blue;
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: avatarInitial,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    canvas.drawCircle(Offset(50, 50), 50, paintCircle);
    textPainter.layout();
    textPainter.paint(canvas,
        Offset((100 - textPainter.width) / 2, (100 - textPainter.height) / 2));
    final img = await pictureRecorder.endRecording().toImage(100, 100);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  String _gerarAvatarApartirDonome([String? userName]) {
    String initials = 'AA';

    if (_user?.displayName != null && _user!.displayName!.isNotEmpty) {
      List<String> nameParts = _user!.displayName!.split(' ');
      if (nameParts.isNotEmpty) {
        initials = '';
        for (var part in nameParts) {
          initials += part.characters.first.toUpperCase();
        }
      }
    }

    return initials;
  }

  String _gerarAvatarUsuario() {
    return _gerarAvatarApartirDonome();
  }

  void _centralizarUsuario() {
    if (busLocation != null && googleMapController != null) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: busLocation,
            zoom: 14,
            bearing: currentHeading,
          ),
        ),
      );
    }
  }

  void _girarMapa(double heading) {
    if (googleMapController != null) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: busLocation,
            zoom: 15,
            bearing: heading,
          ),
        ),
      );
    }
  }

  void _openProfilePage() async {
    // Navigate to ProfilePage
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          onLogout: widget.onLogout,
          onUpdate: (user, userImage) {
            // Callback quando a imagem do perfil for alterada
            widget.updateProfileImageCallback(userImage);
            widget.onUpdate(_user, _userImage);
          },
          // Passar informações do usuário para edição
          userName: _user?.displayName ?? 'Nome Dinâmico',
          userEmail: _user?.email ?? 'email.dinamico@example.com',
          userImageURL: _user?.photoURL ?? 'URL da imagem', profile: null,
          userImageUrl: '',
        ),
      ),
    );
    // Atualizar a imagem do perfil quando retornar
    _carregarImagemUsuario();
  }
}
