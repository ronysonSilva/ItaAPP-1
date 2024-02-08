import 'dart:io';
import 'dart:ui';
import '../login/servicos/autenticacao_servico.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import '../controllers/map_markers.dart';
import '../mapa/map_view.dart';
import '../mapa/map_view_lixo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_android/url_launcher_android.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  }

  Future<void> _fetchUser() async {
    User? user = _auth.currentUser;
    setState(() {
      _user = user;
    });
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
          title: Text("Escolher foto"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Escolher da galeria"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("Tirar uma foto"),
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
        // menuaberto9b1 (6:2)
        width: double.infinity,
        height: 844,
        decoration: BoxDecoration(
          color: Color(0xffdfe9ef),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 27,
              sigmaY: 27,
            ),
            child: Stack(
              children: [
                Positioned(
                  // group13PVM (6:3)
                  left: 0,
                  top: 0,
                  child: Align(
                    child: SizedBox(
                      width: 612,
                      height: 796,
                      child: Image.asset(
                        'assets/page-1/images/group-13-sfR.png',
                        width: 612,
                        height: 796,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle26TVD (6:6)
                  left: 192,
                  top: 0,
                  child: Align(
                    child: SizedBox(
                      width: 197,
                      height: 127,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.529, -0.912),
                            end: Alignment(0, 1),
                            colors: <Color>[Color.fromARGB(255, 255, 255, 255)],
                            stops: <double>[1],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group23Vwh (6:7)
                  left: 78,
                  top: 99,
                  child: Align(
                    child: SizedBox(
                      width: 159,
                      height: 386,
                      child: Image.asset(
                        'assets/page-1/images/group-23.png',
                        width: 159,
                        height: 386,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // groupZgf (6:111)
                  left: 227,
                  top: 469,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(1.79, 1.79, 1.79, 1.79),
                    width: 23,
                    height: 23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.7109413147),
                      gradient: LinearGradient(
                        begin: Alignment(-2.089, -3.241),
                        end: Alignment(2.289, 3.474),
                        colors: <Color>[
                          Color(0xff4769e3),
                          Color(0xff1669e7),
                          Color(0xff670aff)
                        ],
                        stops: <double>[0, 0.586, 1],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f0e174a),
                          offset: Offset(0, 3.707324028),
                          blurRadius: 1.85,
                        ),
                      ],
                    ),
                    child: Center(
                      // componentsavatarcircles8dH (6:113)
                      child: SizedBox(
                        width: 19,
                        height: 19,
                        child: Image.asset(
                          'assets/images/icons/sun_icon.png',
                          width: 19,
                          height: 19,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle221q1u (6:114)
                  left: 76,
                  top: 183,
                  child: Align(
                    child: SizedBox(
                      width: 56,
                      height: 43,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group25Kxf (6:115)
                  left: 0,
                  top: 598,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 56.27, 29, 43.54),
                    width: 390,
                    height: 245,
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
                        Container(
                          // group21uvs (6:132)
                          margin: EdgeInsets.fromLTRB(0, 46, 0, 0),
                          padding: EdgeInsets.fromLTRB(19.5, 27, 19.5, 13.46),
                          width: 100,
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
                            // group188Yj (6:134)
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // objectsfoZ (6:136)
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 7.54),
                                  width: 38,
                                  height: 39,
                                  child: Image.asset(
                                    'assets/page-1/images/objects.png',
                                    width: 38,
                                    height: 39,
                                  ),
                                ),
                                Text(
                                  // coletadelixoxnf (6:135)
                                  'Coleta de lixo',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.w500,
                                    height: 1.30,
                                    color: Color(0xfc003768),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          // group10dto (6:125)
                          margin: EdgeInsets.fromLTRB(0, 46, 0, 0),
                          padding: EdgeInsets.fromLTRB(19, 25.34, 19, 13.46),
                          width: 100,
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
                            // group19f4o (6:127)
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group17CqR (6:129)
                                  margin: EdgeInsets.fromLTRB(2, 0, 0, 2.64),
                                  width: 45,
                                  height: 45,
                                  child: Image.asset(
                                    'assets/page-1/images/group-17-QC3.png',
                                    width: 45,
                                    height: 45,
                                  ),
                                ),
                                Text(
                                  // nibusgrtisuE3 (6:128)
                                  'Ônibus Grátis',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.w500,
                                    height: 1.30,
                                    color: Color(0xfc003768),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          // autogroupwjsjbsZ (CFRB4qTKPD9ykim2ZfwjSj)
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // expandlessfill0wght300grad0ops (6:146)
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                width: 34,
                                height: 34,
                                child: Image.asset(
                                  'assets/page-1/images/expandlessfill0wght300grad0opsz24-1.png',
                                  width: 34,
                                  height: 34,
                                ),
                              ),
                              Container(
                                // group11De3 (6:118)
                                margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                                padding:
                                    EdgeInsets.fromLTRB(23.5, 25, 23.5, 13.46),
                                width: 100,
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
                                  // group203sy (6:120)
                                  padding: EdgeInsets.fromLTRB(0, 4.04, 0, 0),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // sunnysnowingfill0wght300grad0o (6:121)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 9.94),
                                        width: 34,
                                        height: 34,
                                        child: Image.asset(
                                          'assets/page-1/images/sunnysnowingfill0wght300grad0opsz24-1.png',
                                          width: 34,
                                          height: 34,
                                        ),
                                      ),
                                      Text(
                                        // defesacivilpXM (6:123)
                                        'Defesa Civil',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'DM Sans',
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.w500,
                                          height: 1.30,
                                          color: Color(0xfc003768),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // rectangle202wM5 (6:148)
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
                            decoration: BoxDecoration(
                              color: Color(0xe5003768),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group227CH1 (6:149)
                  left: 36,
                  top: 38,
                  child: Container(
                    width: 329,
                    height: 665,
                    child: Stack(
                      children: [
                        Positioned(
                          // autogroupvsktuSK (CFRBXuWYcM6qatyZbWVSkT)
                          left: 65,
                          top: 7.9,
                          child: Container(
                            width: 264,
                            height: 40,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // tempolimpo23PsH (6:165)
                                  margin: EdgeInsets.fromLTRB(0, 21, 10, 0),
                                  child: Text(
                                    'Tempo limpo, 23º',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'DM Sans',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.30,
                                      color: Color(0xffdceaf3),
                                    ),
                                  ),
                                ),
                                Container(
                                  // group301fpo (6:166)
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          print('Ícone de Notificações');
                                        },
                                        icon: Icon(
                                          Icons.notifications,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                        padding: EdgeInsets.all(12),
                                        splashRadius: 20,
                                        color: Color(0x4cdcebf3),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          print('Ícone de Configurações');
                                        },
                                        icon: Icon(
                                          Icons.settings,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                        padding: EdgeInsets.all(12),
                                        splashRadius: 20,
                                        color: Color.fromARGB(75, 9, 126, 189),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // group228Djq (6:150)
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  width: 33,
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
                        /*Positioned(
                          // frame228Wyq (6:153)
                          left: 5,
                          top: 580,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 56,
                            height: 24,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // logoutfill0wght400grad0opsz241 (6:154)
                                  margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    'assets/images/icons/exit_icon.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  // sairtUb (6:156)
                                  'Sair',
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
                        ),*/
                        /*const Divider(
                          height: 1200,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black,
                        ),*/
                        /*Positioned(
                          // frame230V71 (6:161)
                          left: 4,
                          top: 400,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 150,
                            height: 24,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // lockresetfill0wght400grad0opsz (6:162)
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
                                  // alterarsenhaUDq (6:164)
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
                        ),*/
                        Positioned(
                          // frame229RDd (6:157)
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
                                  ),
                                ),
                              );
                              _loadUserImage();
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 500,
                              height: 65,
                              //decoration: BoxDecoration(
                              //border: Border.all(color: Color.fromARGB(177, 0, 98, 255)),
                              //),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // accountcirclefill0wght400grad0 (6:158)
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      'assets/images/icons/profile_icon.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  Text(
                                    // meuperfilmB1 (6:160)
                                    'Meu Perfil',
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
                          // frame230V71 (6:161)
                          left: 0,
                          top: 460,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 150,
                            height: 24,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // lockresetfill0wght400grad0opsz (6:162)
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  width: 24,
                                  height: 24,
                                  child: Image.asset(
                                    'assets/images/icons/change_password_icon.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                Text(
                                  // alterarsenhaUDq (6:164)
                                  'Alterar Senha',
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
                        Positioned(
                          // groupo1D (6:169)
                          left: 1,
                          top: 0,
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(3.69, 3.69, 3.69, 3.69),
                            width: 48.23,
                            height: 48.23,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(24.1128807068),
                              gradient: LinearGradient(
                                begin: Alignment(-2.089, -3.241),
                                end: Alignment(2.289, 3.474),
                                colors: <Color>[
                                  Color(0xff4769e3),
                                  Color(0xff1669e7),
                                  Color(0xff670aff)
                                ],
                                stops: <double>[0, 0.586, 1],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f0e174a),
                                  offset: Offset(0, 3.707324028),
                                  blurRadius: 1.853662014,
                                ),
                              ],
                            ),
                            child: Center(
                              // componentsavatarcirclesMgw (6:171)
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
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // oliago4bM (6:172)
                          left: 65,
                          top: 2.0703735352,
                          child: Align(
                            child: SizedBox(
                              width: 86,
                              height: 28,
                              child: Text(
                                _user?.displayName ?? '',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'DM Sans',
                                  fontSize: 21.4689273834,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3025,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //-------------------------------------------------------------------------------------------------------------------------
                Positioned(
                  // group2988r7 (6:173)
                  left: 0,
                  top: 245,
                  child: Container(
                    width: 545.82,
                    height: 141,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //=============================================================================

                        Container(
                          // autogroupphuv3TH (CFRC74DyYyxXjDCR24pHuV)
                          margin: EdgeInsets.fromLTRB(45, 0, 0, 16.21),
                          height: 119.79,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /*Container(
                                  // autogroupphuv3TH (CFRC74DyYyxXjDCR24pHuV)
                                  margin: EdgeInsets.fromLTRB(45, 0, 0, 16.21),
                                  height: 119.79,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // First set of containers
                                        Container(
                                          // group295x4T (6:174)
                                          margin: EdgeInsets.fromLTRB(
                                              0, 0, 7.36, 0),
                                          padding: EdgeInsets.fromLTRB(
                                              16.81, 11.56, 16.81, 11.56),
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xff255c90),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // autogrouplygx1oR (CFRCJU4dRrF41mhcVcLyGX)
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 11.56, 7.36, 0),
                                                width: 72.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // sex27rT (6:181)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 10.47),
                                                      width: double.infinity,
                                                      child: Text(
                                                        'Sex. 2',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize:
                                                              16.4881286621,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1.2125,
                                                          color:
                                                              Color(0xffeaeaea),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      // container sexta
                                                      width: double.infinity,
                                                      height: 54.64,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                11.5587301254),
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // autogroupgwgt9HM (CFRCQdZ2RomZvKekosgWGT)
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 1.05),
                                                width: 48.34,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      // autogroupkfuwF5V (CFRCVo562FuthvFz3cKFUw)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 11.56),
                                                      width: double.infinity,
                                                      height: 42.03,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x19e9e9e9),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4.2031745911),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '27º',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize:
                                                                16.4881286621,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2125,
                                                            color: Color(
                                                                0xffeaeaea),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      // autogroupdcapt8T (CFRCZD94f58t2r1rtvDcaP)
                                                      width: double.infinity,
                                                      height: 42.03,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x19e9e9e9),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4.2031745911),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '23º',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize:
                                                                16.4881286621,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.2125,
                                                            color: Color(
                                                                0xffeaeaea),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Second set of containers
                                        Container(
                                          // group296xPD (6:182)
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 8, 0),
                                          padding: EdgeInsets.fromLTRB(
                                              16.81, 11.56, 16.81, 11.56),
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xff255c90),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // autogrouprelsr7D (CFRCrT9LQ4VBrJgtzYrELs)
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 11.56, 7.36, 0),
                                                width: 72.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // sab396K (6:189)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 10.47),
                                                      width: double.infinity,
                                                      child: Text(
                                                        'Sab. 3',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize:
                                                              16.4881286621,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1.2125,
                                                          color:
                                                              Color(0xffeaeaea),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      // container sabado
                                                      width: double.infinity,
                                                      height: 54.64,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                11.5587301254),
                                                        color: Color.fromARGB(
                                                            255, 252, 251, 251),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // autogroupxakkx3m (CFRCxHJxGBYyPCrjcdxAkK)
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 1.05),
                                                width: 48.34,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      // autogroup2wpbTWK (CFRD3MzpaB5caPX8vq2WpB)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 11.56),
                                                      width: double.infinity,
                                                      height: 42.03,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x19e9e9e9),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4.2031745911),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '27º',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize:
                                                                16.4881286621,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2125,
                                                            color: Color(
                                                                0xffeaeaea),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      // autogroupp5cpvPu (CFRD6cQQe55EiVPMw3p5cP)
                                                      width: double.infinity,
                                                      height: 42.03,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x19e9e9e9),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4.2031745911),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '23º',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize:
                                                                16.4881286621,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.2125,
                                                            color: Color(
                                                                0xffeaeaea),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Add more sets of containers if needed
                                      ],
                                    ),
                                  ),
                                ),*/

                                Container(
                                    // Your existing code for the second Container
                                    ),
                                Container(
                                    // Your existing code for the third Container
                                    ),
                                // Add more Container widgets if needed
                              ],
                            ),
                          ),
                        ),

                        /*Container(
                          // container
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: 418,
                          decoration: BoxDecoration(
                            color: Color(0xff15426c),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Align(
                            // rectangle226P6T (6:199)
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 143,
                              height: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color(0xff265d90),
                                ),
                              ),
                            ),
                          ),
                        ),*/
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
                          color: Color(0xffc6d9eb),
                          boxShadow: [
                            BoxShadow(
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
                  // rectangle218Bo1 (6:201)
                  left: 54,
                  top: 163,
                  child: Align(
                    child: SizedBox(
                      width: 69,
                      height: 52,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Color(0xffeaeaea),
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
                          color: Color(0xffb3c9de),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group299p5H (6:203)
                  left: 301,
                  top: 135,
                  child: Container(
                    width: 46,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffb3c9de),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        '27º',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 15.6911201477,
                          fontWeight: FontWeight.w700,
                          height: 1.2125,
                          color: Color(0xff1b5a98),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // 51D (6:206)
                  left: 312,
                  top: 190,
                  child: Align(
                    child: SizedBox(
                      width: 27,
                      height: 20,
                      child: Text(
                        '23º',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 15.6911201477,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xff1b5a98),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // hojeA2f (6:207)
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
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xff1b5a98),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // parcialmenteensolaradoFpo (6:208)
                  left: 137,
                  top: 170,
                  child: Align(
                    child: SizedBox(
                      width: 98,
                      height: 39,
                      child: Text(
                        'Parcialmente ensolarado',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: Color(0xff174976),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle226XnK (6:209)
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
                  // group3002UB (6:210)
                  left: 140,
                  top: 137,
                  child: Container(
                    width: 400,
                    height: 17,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // ellipse89Yo (6:212)
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          width: 10,
                          height: 90,
                          child: Image.asset(
                            'assets/images/icons/gota_icon.png',
                            width: 6.18,
                            height: 9.88,
                          ),
                        ),
                        Text(
                          // 3u5 (6:211)
                          '28%',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 13.9664154053,
                            fontWeight: FontWeight.w500,
                            height: 1.2125,
                            color: Color(0xff86a1b9),
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
    return LatLng(0, 0);
  }
}
