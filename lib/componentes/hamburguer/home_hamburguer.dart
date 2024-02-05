import 'package:flutter/material.dart';

class MenuHamburguer extends StatelessWidget {
  final Function() onLogout;
  final Function() onNavigateToSomeRoute;

  MenuHamburguer({
    required this.onLogout,
    required this.onNavigateToSomeRoute,
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
            title: Text('Sair'),
            onTap: onLogout,
          ),
          // ListTile(
          //title: Text('Voltar para o mapa'),
          //   onTap: onNavigateToSomeRoute,
          // ),
          ListTile(
            title: Text('Voltar para o mapa'),
            onTap: () {
              // Navegar para a rota /home
              Navigator.of(context).pushNamed('/mapa');
            },
          ),
          // Adicione outras opções de rota conforme necessário
        ],
      ),
    );
  }
}
