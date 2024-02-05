import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importe o pacote do Google Maps

import '../login/servicos/autenticacao_servico.dart';

class MenuHamburguer extends StatelessWidget {
  GoogleMapController?
      _mapController; // Declare a referência ao GoogleMapController

  final Function() onLogout;
  final Function() onNavigateToSomeRoute;
  final VoidCallback onNewButtonAction;

  MenuHamburguer({
    required this.onLogout,
    required this.onNavigateToSomeRoute,
    required this.onNewButtonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Deslogar"),
            onTap: () {
              SystemNavigator.pop();
              // Deslogar do serviço de autenticação (por exemplo, Firebase)
              AutenticacaoServico().deslogar();

              // Garanta que o mapa seja fechado e liberado
              _mapController?.dispose();
              _mapController = null;

              // Encerrar todas as rotas e voltar para a tela de login
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
            },
          ),
          // Outros itens do menu...
        ],
      ),
    );
  }
}
