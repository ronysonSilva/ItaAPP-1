import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meu_app/componentes/mapa/map_view.dart';
import 'package:meu_app/componentes/mapa/map_view_lixo.dart';
import 'package:meu_app/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_tempo.dart';
import '../api/carPosicao.dart';
import '../controllers/map_markers.dart';
import '../estilosMapa/componente/Map_style_manager.dart';
import '../estilosMapa/map_style_branco.dart';
import '../hamburguer/gaveta_mapa_hamburguer.dart';
import '../localizacao/LocationTracker.dart';
import '../perfil/ProfilePage.dart';
import '../rotas/rota.dart';
import 'componentes/map_lixo/map_routes.dart';

class MapViewLixo extends StatefulWidget {
  final Function() onLogout;
  final void Function(User? user, File? userImage) onUpdate;
  final String userName;
  final String userEmail;
  final String userImageUrl;
  final void Function(File? userImage) updateProfileImageCallback;

  MapViewLixo({
    required this.updateProfileImageCallback,
    required this.onLogout,
    required this.onUpdate,
    required this.userName,
    required this.userEmail,
    required this.userImageUrl,
    required userImageURL,
  });

  @override
  _MapViewLixoState createState() => _MapViewLixoState();
}

class _MapViewLixoState extends State<MapViewLixo> {
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
  List<LatLng> _route1Coordinates = [];
  List<LatLng> _route2Coordinates = [];

  Rota rota1 = Rota.rota1();
  Rota rota2 = Rota.rota2();

  @override
  void initState() {
    super.initState();
    _fetchUser();
    locationTracker = LocationTracker();
    locationTracker.startTracking();
    LocationTracker.busLocationStream.listen(_updateBusMarker);
    userImageUrl = widget.userImageUrl;

    FlutterCompass.events?.listen((CompassEvent? event) {
      if (event != null && event.heading != null && followUser) {
        setState(() {
          currentHeading = event.heading!;
        });
      }
    });

    MapMarkers.getMarkers(context).then((result) {
      setState(() {
        markers = result;
      });
    });

    centerOnBusTimer = Timer.periodic(Duration(minutes: 1), (Timer timer) {
      _centerOnBus();
    });

    _controller = Completer();
    _controller.future.then((controller) {
      googleMapController = controller;
      mapStyleManager?.setController(googleMapController);
      mapStyleManager?.setMapStyle(MapStyleBranco.getCustomMapStyle());
    });
    _initializeRoutes();
  }

  Future<void> _fetchUser() async {
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
          await _saveUserImage();
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

  Future<void> _saveUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_userImage != null) {
      prefs.setString('userImage', _userImage!.path);
    }
  }

  Future<void> _loadUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('userImage');

    if (imagePath != null) {
      setState(() {
        _userImage = File(imagePath);
      });
    }
  }

  void _initializeRoutes() {
    _route1Coordinates = rota1.coordenadas;
    _route2Coordinates = rota2.coordenadas;
    _polylines = MapRoutesComponent.getPolylines(
        [_route1Coordinates, _route2Coordinates],
        ['rota1', 'rota2'],
        [Colors.red, Colors.green]);
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
              _loadUserImage();
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
                  markers: markers.union(carPositionMarkers),
                  polylines: _polylines,
                  myLocationEnabled: false,
                  compassEnabled: true,
                  onCameraMove: (CameraPosition position) {
                    // Se o usuário moveu o mapa, desativa o modo de seguir o usuário
                    followUser = false;
                  },
                  onCameraIdle: () {
                    if (followUser) {
                      _rotateMap(currentHeading);
                    }
                  },
                ),
                Positioned(
                  top: 70,
                  left: 20,
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
                                _generateAvatarFromName(widget.userName),
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

//RONY

                Positioned(
                  // Aqui é onde se desenha e orienta o azul gradiente
                  left: 0,
                  top: 500,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 40.27, 29, 43.54),
                    width: 450,
                    height: 190,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1, 1.031),
                        end: Alignment(1, -1),
                        colors: <Color>[
                          Color(0xff003768),
                          Color(0xa4003768),
                          Color(0x00003768)
                        ],
                        stops: <double>[0, 0.461, 1],
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MapView(
                                  onLogout: () async {
                                    // Adicione aqui a lógica para fazer logout
                                  },
                                  onUpdate: (user, userImage) {
                                    // Adicione aqui a lógica para atualizar o usuário
                                  },
                                  userName: 'Nome do Usuário',
                                  userEmail: 'email@example.com',
                                  userImageUrl: 'URL da Imagem do Perfil',
                                  updateProfileImageCallback:
                                      (File? userImage) {},
                                  userImageURL: null,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            // group212uH (14:415)
                            margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            padding: EdgeInsets.fromLTRB(19, 15, 19, 13),
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xfff6f7fa),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x66153a5b),
                                  offset: Offset(0, 4),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            child: Container(
                              // group18GYj (14:409)
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // objects4Dh (14:399)
                                    margin: EdgeInsets.fromLTRB(5, 0, 0, 7),
                                    width: 50,
                                    height: 50,
                                    child: Image.asset(
                                      'assets/images/icons/bus_alert.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Text(
                                    // coletadelixoMib (14:373)
                                    'Ônibus Grátis',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'DM Sans',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      color: Color(0xff003768),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MapView(
                                  onLogout: () async {
                                    // Adicione aqui a lógica para fazer logout
                                  },
                                  onUpdate: (user, userImage) {
                                    // Adicione aqui a lógica para atualizar o usuário
                                  },
                                  userName: 'Nome do Usuário',
                                  userEmail: 'email@example.com',
                                  userImageUrl: 'URL da Imagem do Perfil',
                                  updateProfileImageCallback:
                                      (File? userImage) {},
                                  userImageURL: null,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            // group103bR (14:51)
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            padding: EdgeInsets.fromLTRB(19, 10, 19, 13),
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x66153a5b),
                                  offset: Offset(0, 4),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            child: Container(
                              // group19VCX (14:410)
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // group173E3 (14:384)
                                    margin: EdgeInsets.fromLTRB(5, 10, 0, 7),
                                    width: 45,
                                    height: 45,
                                    child: Image.asset(
                                      'assets/images/icons/trash.png',
                                      width: 45,
                                      height: 45,
                                    ),
                                  ),
                                  Text(
                                    // nibusgrtisx67 (14:374)
                                    'Coleta de lixo',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'DM Sans',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      color: Color(0xff003768),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        /*Container(
                        // autogrouppfhu37Z (SWfE8cA48bYRCNztS5PFhu)
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // expandlessfill0wght300grad0ops (14:389)
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 34,
                              height: 34,
                              child: Image.asset(
                                'assets/images/icons/show_modal_button.png',
                                width: 34,
                                height: 34,
                              ),
                            ),
                            Container(
                              // group11TSB (14:56)
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              padding: EdgeInsets.fromLTRB(19, 10, 19, 13),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10 * fem),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x66153a5b),
                                    offset: Offset(0, 4),
                                    blurRadius: 0,
                                  ),
                                ],
                              ),
                              child: Container(
                                // group20jPh (14:411)
                                padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                                width: 100,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // sunnysnowingfill0wght300grad0o (14:387)
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                                      width: 38,
                                      height: 39,
                                      child: Image.asset(
                                        'assets/images/icons/sunny_snowing.png',
                                        width: 38,
                                        height: 39,
                                      ),
                                    ),
                                    Text(
                                      // defesacivil8wd (14:375)
                                      'Defesa Civil',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'DM Sans',
                                        fontSize: 9.534535408 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3025 * ffem / fem,
                                        color: Color(0xff003768),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),*/
                      ],
                    ),
                  ),
                ),

//RONY

                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /* Container(
                        color: Colors.red,
                        child: Text(
                          'Olá, ${widget.userName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),*/
                      SizedBox(height: 8),
                      Apitempo(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: CarPositionComponentWithoutMap(
                    onUpdateMarkers: (Set<Marker> newMarkers) {
                      setState(() {
                        carPositionMarkers = newMarkers;
                      });
                    },
                    userAvatar: userImageUrl,
                  ),
                ),
                MapRoutesComponent(
                  polylines: _polylines,
                  // Adicione as coordenadas das rotas se necessário
                  route1Coordinates: _route1Coordinates,
                  route2Coordinates: _route2Coordinates,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateBusMarker(LatLng busLocation) async {
    this.busLocation = busLocation;

    final BitmapDescriptor busIcon =
        await _getResizedBusIconWithInitial(_generateBusAvatar());

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
  }

  Future<BitmapDescriptor> _getResizedBusIcon(File userImage) async {
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

  Future<BitmapDescriptor> _getResizedBusIconWithInitial(
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

    // Draw a blue circle
    canvas.drawCircle(Offset(50, 50), 50, paintCircle);

    // Layout and paint the text in the center of the circle
    textPainter.layout();
    textPainter.paint(canvas,
        Offset((100 - textPainter.width) / 2, (100 - textPainter.height) / 2));

    // Convert the drawing to a BitmapDescriptor
    final img = await pictureRecorder.endRecording().toImage(100, 100);
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  String _generateAvatarFromName([String? userName]) {
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

  String _generateBusAvatar() {
    return _generateAvatarFromName();
  }

  void _centerOnBus() {
    if (busLocation != null && googleMapController != null) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: busLocation,
            zoom: 14, //17
            bearing: currentHeading,
          ),
        ),
      );
    }
  }

  void _rotateMap(double heading) {
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
        ),
      ),
    );
    // Atualizar a imagem do perfil quando retornar
    _loadUserImage();
  }
}
