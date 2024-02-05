import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../map_style.dart';
import '../map_style_branco.dart';

class MapStyleManager {
  late Completer<GoogleMapController> _completer;
  late GoogleMapController _mapController;
  bool _isWhiteStyle = false;
  late Timer _timer;

  MapStyleManager.withController(GoogleMapController initialController) {
    _mapController = initialController;
    _completer = Completer<GoogleMapController>.sync();
    _completer.complete(initialController);
    _checkDayNightStyle(); // Verifica o estilo ao iniciar
    _startTimer(); // Inicia o temporizador para verificar o estilo periodicamente
  }

  MapStyleManager(Completer<GoogleMapController> controller) {
    _completer = Completer<GoogleMapController>();
    _startTimer(); // Inicia o temporizador para verificar o estilo periodicamente
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _updateMapStyle();
    });
  }

  void _updateMapStyle() {
    _checkDayNightStyle(); // Verifica se é dia ou noite
    print("Atualizando estilo do mapa: $_isWhiteStyle");
    setMapStyle(_isWhiteStyle
        ? MapStyleBranco.getCustomMapStyle()
        : MapStyle.getCustomMapStyle());
  }

  void _checkDayNightStyle() {
    DateTime now = DateTime.now();

    print("Hora atual: ${now.hour}:${now.minute}");

    // Converte as horas para minutos totais desde a meia-noite
    int totalMinutes = now.hour * 60 + now.minute;

    // Defina os minutos de início para os estilos branco e preto
    int whiteStyleStartMinutes = 6 * 60; // 6:00 da manhã
    int blackStyleStartMinutes = 18 * 60; // 6:00 da tarde

    if (totalMinutes >= whiteStyleStartMinutes &&
        totalMinutes < blackStyleStartMinutes) {
      _isWhiteStyle = true; // Estilo branco durante o dia
    } else {
      _isWhiteStyle = false; // Estilo padrão durante a noite
    }

    print("Estilo branco? $_isWhiteStyle");
    setMapStyle(_isWhiteStyle
        ? MapStyleBranco.getCustomMapStyle()
        : MapStyle.getCustomMapStyle());
  }

  void setMapStyle(String customMapStyle) {
    _mapController.setMapStyle(customMapStyle);
  }

  void setController(GoogleMapController controller) {
    _mapController = controller;
    _completer.complete(controller);
  }

  Future<GoogleMapController> getController() {
    return _completer.future;
  }

  void dispose() {
    _timer.cancel();
  }
}
