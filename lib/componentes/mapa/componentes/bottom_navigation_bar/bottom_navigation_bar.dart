import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meu_app/componentes/chamados/chamados.dart';
//import 'package:flutter_app/new_page.dart';

class bottombar extends StatefulWidget {
  @override
  _bottombar createState() => _bottombar();
}

class _bottombar extends State<bottombar> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    //MapView("Minha conta"),
    chamados("chamados"),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "Minha conta"),
          BottomNavigationBarItem(
              icon: Icon(Icons.feed_outlined), label: "Meus pedidos"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
