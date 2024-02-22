import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:meu_app/componentes/hamburguer/Meus%20chamados/meus_chamados.dart';
import 'package:meu_app/componentes/hamburguer/notification/notification.dart';
import 'package:meu_app/componentes/hamburguer/previsao_semana.dart';
import 'package:meu_app/componentes/hamburguer/settings/settings.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import '../api/api_tempo_semana.dart';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';
import 'package:meu_app/utils.dart';

import '../perfil/ProfilePage.dart';

class GavetaMap extends StatefulWidget {
  final Function() onLogout;
  final Function() onNavigateToSomeRoute;
  final VoidCallback onNewButtonAction;
  final VoidCallback onProfileImageChanged;
  final Function(User?, File?) onUpdate;

  GavetaMap({
    required this.onLogout,
    required this.onNavigateToSomeRoute,
    required this.onProfileImageChanged,
    required this.onNewButtonAction,
    required this.onUpdate,
  });

  @override
  _GavetaMapState createState() => _GavetaMapState();
}

class _GavetaMapState extends State<GavetaMap> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  File? _userImage;
  bool isCalculatingRoute = false;

  @override
  void initState() {
    super.initState();
    _fetchUser();
    _loadUserImage();
    super.initState();
    fetchWeatherData();
  }

  Future<void> _fetchUser() async {
    User? user = _auth.currentUser;
    setState(() {
      _user = user;
    });
  }

  Map<String, dynamic> weatherData = {};
  Future<void> fetchWeatherData() async {
    try {
      final response =
          await http.get(Uri.parse('http://45.170.17.10:5000/clima'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        setState(() {
          weatherData = responseData;
        });
      } else {
        print('API request failed with status ${response.statusCode}');
        setState(() {
          weatherData = {'error': 'Falha ao carregar dados da API'};
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        weatherData = {'error': 'Falha ao carregar dados da API'};
      });
    }
  }

  Future<List<Previsao>> fetchPrevisoes() async {
    final response =
        await http.get(Uri.parse('http://45.170.17.10:5000/previsao_tempo'));
    if (response.statusCode == 200) {
      final List<dynamic> previsoesJson =
          jsonDecode(response.body)['previsoes'];
      return previsoesJson.map((json) => Previsao.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar previsões');
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

  Future<void> _saveUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_userImage != null) {
      prefs.setString('userImage', _userImage!.path);
    }
  }

  String _generateAvatarText() {
    String initials = '';
    if (_user != null && _user!.displayName != null) {
      List<String> nameParts = _user!.displayName!.split(' ');
      if (nameParts.length > 0) {
        initials += nameParts[0][0].toUpperCase();
        if (nameParts.length > 1) {
          initials += nameParts[1][0].toUpperCase();
        }
      }
    }
    return initials;
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _userImage = File(pickedFile.path);
      });
      _saveUserImage();
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _userImage = File(pickedFile.path);
      });
      _saveUserImage();
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _showImageOptions() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Escolher foto"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Escolher da galeria"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Tirar uma foto"),
                onTap: () {
                  Navigator.pop(context);
                  _takePhoto();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 844,
        child: ClipRect(
          child: Stack(
            children: [
              const Positioned(
                left: 100,
                top: 0,
                child: Align(
                  child: SizedBox(
                    width: 612,
                    height: 796,
                  ),
                ),
              ),
              Positioned(
                left: 192,
                top: 0,
                child: Align(
                  child: SizedBox(
                    width: 197,
                    height: 127,
                  ),
                ),
              ),
              Positioned(
                left: 227,
                top: 469,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.7109413147),
                    gradient: const LinearGradient(
                      begin: Alignment(-2.089, -3.241),
                      end: Alignment(2.289, 3.474),
                      colors: <Color>[
                        Color(0xff4769e3),
                        Color(0xff1669e7),
                        Color(0xff670aff)
                      ],
                      stops: <double>[0, 0.586, 1],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 598,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 56.27, 29, 43.54),
                  width: 390,
                  height: 245,
                  decoration: const BoxDecoration(
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
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ),
                    child: Align(
                      child: SizedBox(
                        width: 390,
                        height: 844,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xe5003768),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 38,
                child: Container(
                  width: 329,
                  height: 665,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 65,
                        top: 7.9,
                        child: Container(
                          width: 264,
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 21, 10, 0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Text(
                                    'Temperatura: ${weatherData['temperatura']}°C',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PrevisaoSemana(),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.thermostat_auto_outlined,
                                        color: Colors.white,
                                      ),
                                      iconSize: 20,
                                      padding: const EdgeInsets.all(12),
                                      splashRadius: 20,
                                      color: const Color(0x4cdcebf3),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Settings(),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.settings,
                                        color: Colors.white,
                                      ),
                                      iconSize: 20,
                                      padding: const EdgeInsets.all(12),
                                      splashRadius: 20,
                                      color:
                                          const Color.fromARGB(75, 9, 126, 189),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 30,
                                height: 35,
                                child: Image.asset(
                                  'assets/images/icons/back_icon.png',
                                  width: 33,
                                  height: 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 4,
                        top: 400,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => meusChamados()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 150,
                            height: 24,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    'assets/images/icons/chamados_icon.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  'Meus Chamados',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 14.4000453949,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3025,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 4,
                        top: 500,
                        child: GestureDetector(
                          onTap: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                  onLogout: widget.onLogout,
                                  onUpdate: (user, userImage) {
                                    widget.onProfileImageChanged();
                                    widget.onUpdate(_user, _userImage);
                                  },
                                  userName:
                                      _user?.displayName ?? 'Nome Dinâmico',
                                  userEmail: _user?.email ??
                                      'email.dinamico@example.com',
                                  userImageURL:
                                      _user?.photoURL ?? 'URL da imagem',
                                  profile: null,
                                  userImageUrl: '',
                                ),
                              ),
                            );
                            _loadUserImage();
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 500,
                            height: 65,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    'assets/images/icons/profile_icon.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  'Meu Perfil',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 14.4000453949,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3025,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 460,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => notificacoes()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 150,
                            height: 24,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  width: 24,
                                  height: 24,
                                  child: Icon(Icons.notifications_outlined,
                                      color: Colors.white),
                                ),
                                Text(
                                  'Notificações',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 14.4000453949,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3025,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1,
                        top: 0,
                        child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(3.69, 3.69, 3.69, 3.69),
                          width: 48.23,
                          height: 48.23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.1128807068),
                            gradient: const LinearGradient(
                              begin: Alignment(-2.089, -3.241),
                              end: Alignment(2.289, 3.474),
                              colors: <Color>[
                                Color(0xff4769e3),
                                Color(0xff1669e7),
                                Color(0xff670aff)
                              ],
                              stops: <double>[0, 0.586, 1],
                            ),
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: _userImage != null
                                  ? FileImage(_userImage!)
                                  : null,
                              child: _userImage == null
                                  ? Text(
                                      _generateAvatarText(),
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        height: 1,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 62,
                        top: 1,
                        child: Align(
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: Text(
                              'Olá ${_user?.displayName?.split(" ")[0] ?? "Usuário"}',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'DM Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 2,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // container hoje
                left: 20,
                top: 125,
                child: Align(
                  child: SizedBox(
                    width: 335,
                    height: 105,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffc6d9eb),
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0x262e3c61),
                            offset: Offset(0, 10),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle220txK (6:202)
                left: 301,
                top: 180,
                child: Align(
                  child: SizedBox(
                    width: 46,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xffb3c9de),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 301,
                top: 135,
                child: Container(
                  width: 46,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffb3c9de),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '${weatherData['temp_max']}°C',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1,
                        color: const Color(0xff1b5a98),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 301,
                top: 185,
                child: Container(
                  width: 46,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xffb3c9de),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '${weatherData['temp_min']}°C',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1,
                        color: const Color(0xff1b5a98),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 64,
                top: 136,
                child: Align(
                  child: SizedBox(
                    width: 35,
                    height: 20,
                    child: Text(
                      'Hoje',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2125,
                        color: const Color(0xff1b5a98),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 137,
                top: 170,
                child: Align(
                  child: SizedBox(
                    width: 98,
                    height: 39,
                    child: Text(
                      '${weatherData['weather_description']}',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        height: 1.2125,
                        color: const Color(0xff174976),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 163,
                child: Align(
                  child: SizedBox(
                    width: 69,
                    height: 52,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Image.asset(
                        'assets/images/icons/sun_icon.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 125,
                top: 137,
                child: Container(
                  width: 400,
                  height: 17,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        width: 10,
                        height: 90,
                        child: Image.asset(
                          'assets/images/icons/gota_icon.png',
                          width: 6.18,
                          height: 9.88,
                        ),
                      ),
                      Text(
                        '${weatherData['humidity']} %',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          color: const Color(0xff86a1b9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 190,
                top: 133,
                child: Container(
                  width: 400,
                  height: 25,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 12,
                        height: 90,
                        child: const Icon(Icons.air, color: Color(0xff86a1b9)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                        child: Text(
                          '  ${weatherData['wind_speed']} m/s',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            height: 1,
                            color: const Color(0xff86a1b9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<LatLng> _getUserLocation(BuildContext context) async {
  try {
    Position position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  } catch (e) {
    print("Error getting user location: $e");
    return const LatLng(0, 0);
  }
}
