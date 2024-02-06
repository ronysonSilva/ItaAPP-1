import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meu_app/componentes/mapa/map_view_lixo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'componentes/login/componentes/firebase_options.dart';
import 'componentes/login/componentes/tela.dart';
import 'componentes/mapa/map_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/config/config.dart';
//import 'package:flutter_launcher_icons/config/config.g.dart';
import 'package:flutter_launcher_icons/config/macos_config.dart';
//import 'package:flutter_launcher_icons/config/macos_config.g.dart';
import 'package:flutter_launcher_icons/config/web_config.dart';
//import 'package:flutter_launcher_icons/config/web_config.g.dart';
import 'package:flutter_launcher_icons/config/windows_config.dart';
//import 'package:flutter_launcher_icons/config/windows_config.g.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/logger.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_generator.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_template.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/pubspec_parser.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:flutter_launcher_icons/web/web_template.dart';
import 'package:flutter_launcher_icons/windows/windows_icon_generator.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:responsive_builder/responsive_builder.dart';

//oi 2

//fiz merda
//rony faz merda
//wallace buga
//teste rony
//teste rony 2

import 'componentes/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Evitar hibernação
  Wakelock.enable();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  void logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AutenticacaoTela()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: isUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return snapshot.data == true
              ? MapView(
                  onLogout: () =>
                      logout(context), // Passar o contexto para o logout
                  onUpdate: (user, userImage) {
                    // Adicione aqui a lógica para atualizar o usuário
                  },
                  userName: 'Nome do Usuário',
                  userEmail: 'email@example.com',
                  userImageUrl: 'URL da Imagem do Perfil',
                  updateProfileImageCallback: (File? userImage) {},
                  userImageURL: null,
                )
              : AutenticacaoTela();
        },
      ),
      routes: {
        '/login': (context) => AutenticacaoTela(),
      },
    );
  }
}
