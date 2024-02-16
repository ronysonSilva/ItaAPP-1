import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LixoPositionComponentWithoutMap extends StatefulWidget {
  final void Function(Set<Marker>) onUpdateMarkers;

  LixoPositionComponentWithoutMap(
      {required this.onUpdateMarkers, required String userAvatar});

  @override
  _LixoPositionComponentWithoutMapState createState() =>
      _LixoPositionComponentWithoutMapState();

  static Future<Set<Marker>> fetchData() async {
    try {
      final String apiUrl = 'http://45.170.17.10:9092/api/positions';
      final String username = 'wallace@wallace';
      final String password = '123123';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('$username:$password')),
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final Set<Marker> markers = {};

        for (var position in data) {
          final BitmapDescriptor carIcon = await _getResizedCarIcon();
          markers.add(
            Marker(
              markerId: MarkerId(position['id'].toString()),
              position: LatLng(position['latitude'], position['longitude']),
              icon: carIcon,
              infoWindow: InfoWindow(title: 'Carro ID ${position['id']}'),
            ),
          );
        }

        return markers;
      } else {
        print('Erro ao buscar dados da API: ${response.statusCode}');
        return Set<Marker>();
      }
    } catch (e) {
      print('Erro ao fazer a solicitação HTTP: $e');
      return Set<Marker>();
    }
  }

  static Future<BitmapDescriptor> _getResizedCarIcon() async {
    final ByteData data = await rootBundle.load('assets/images/bus_color.png');
    final Uint8List bytes = data.buffer.asUint8List();

    final codec = await instantiateImageCodec(
      bytes,
      targetHeight: 150,
      targetWidth: 150,
    );
    final FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? resizedData =
        await frameInfo.image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
  }
}

class _LixoPositionComponentWithoutMapState
    extends State<LixoPositionComponentWithoutMap> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _checkLocationPermissionAndFetchData();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => _fetchData());
  }

  Future<void> _checkLocationPermissionAndFetchData() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    _fetchData();
  }

  Future<void> _fetchData() async {
    final Set<Marker> markers =
        await LixoPositionComponentWithoutMap.fetchData();
    widget.onUpdateMarkers(markers);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}
