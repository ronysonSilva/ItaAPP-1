import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class CustomMarker extends Marker {
  final String title;
  final String description;

  CustomMarker({
    required MarkerId markerId,
    required LatLng position,
    this.title = '',
    this.description = '',
    required BitmapDescriptor icon,
  }) : super(markerId: markerId, position: position);
}

class MapMarkers {
  static Set<Marker> markers = {};
  static Function(Set<Marker>)? onUpdateMarkers;

  static Future<BitmapDescriptor> _getResizedBusIcon() async {
    final ByteData data = await rootBundle.load('assets/images/ponto.png');
    final Uint8List bytes = data.buffer.asUint8List();

    final codec = await instantiateImageCodec(
      bytes,
      targetHeight: 190,
      targetWidth: 130,
    );

    final FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData resizedData =
        (await frameInfo.image.toByteData(format: ImageByteFormat.png))!;

    return BitmapDescriptor.fromBytes(resizedData.buffer.asUint8List());
  }

  static Future<Set<Marker>> getMarkers(BuildContext context) async {
    final BitmapDescriptor resizedBusIcon = await _getResizedBusIcon();

    markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(-22.870407, -43.796822),
        icon: resizedBusIcon,
        onTap: () {
          _showMarkerInfo(
            context,
            'Informações do Ponto 1',
            'Descrição do ponto 1',
            'assets/images/pontos/biaestampa.jpg',
            LatLng(-22.870407, -43.796822),
          );
        },
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(-22.869990, -43.783984),
        icon: resizedBusIcon,
        onTap: () {
          _showMarkerInfo(
            context,
            'Informações do Ponto 2',
            'Descrição do ponto 2',
            'assets/images/pontos/outra_imagem.jpg',
            LatLng(-22.869990, -43.783984),
          );
        },
      ),
    );

    // Adapte conforme necessário para outros marcadores

    return markers;
  }

  static Future<void> fetchData(BuildContext context) async {
    try {
      final String apiUrl = 'http://45.170.17.10:9092/api/positions';
      final String username = 'talmeida21986@gmail.com';
      final String password = 'T1@go0116';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('$username:$password')),
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        await _updateMarkers(context, data);

        print('Dados da API recebidos com sucesso!');
      } else {
        print('Erro ao buscar dados da API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao fazer a solicitação HTTP: $e');
    }
  }

  static Future<void> _updateMarkers(
    BuildContext context,
    List<dynamic> data,
  ) async {
    try {
      markers.clear();

      for (var position in data) {
        final BitmapDescriptor carIcon = await _getResizedBusIcon();
        markers.add(
          Marker(
            markerId: MarkerId(position['id'].toString()),
            position: LatLng(position['latitude'], position['longitude']),
            icon: carIcon,
            infoWindow: InfoWindow(title: 'Carro ID ${position['id']}'),
            onTap: () {
              _showMarkerInfo(
                context,
                'Informações do ônibus',
                'Descrição do ônibus.',
                'assets/images/bus_icon.png',
                LatLng(position['latitude'], position['longitude']),
                arrivalTime: position['attributes']['arrivalTime'],
                pointTime: position['attributes']['pointTime'],
              );
            },
          ),
        );
      }

      onUpdateMarkers?.call(markers);
    } catch (e) {
      print("Error updating markers: $e");
    }
  }

  static void _showMarkerInfo(
    BuildContext context,
    String markerInfo,
    String? description,
    String? imagePath,
    LatLng pointCoordinates, {
    String? arrivalTime,
    String? pointTime,
  }) async {
    try {
      final LatLng userLocation = await _getUserLocation();
      final double distance =
          _calculateDistance(userLocation, pointCoordinates);

      double averageWalkingSpeed = 1.4;
      double estimatedTimeInSeconds = distance / averageWalkingSpeed;

      int estimatedMinutes = (estimatedTimeInSeconds / 60).floor();
      int estimatedSeconds = (estimatedTimeInSeconds % 60).floor();

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informações do Ponto e do Ônibus',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    markerInfo,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  if (description != null) SizedBox(height: 8.0),
                  if (description != null) Text('Descrição: $description'),
                  if (imagePath != null) SizedBox(height: 8.0),
                  if (imagePath != null) Image.asset(imagePath),
                  SizedBox(height: 16.0),
                  ExpansionTile(
                    title: Text('Chegada estimada Ônibus'),
                    children: [
                      Text(
                        'Tempo estimado para a chegada do ônibus: $arrivalTime',
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Tempo estimado para sua chegada no ponto'),
                    children: [
                      Text(
                        'Tempo: $estimatedMinutes min e $estimatedSeconds s.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      print("Error showing marker info: $e");
    }
  }

  static Future<LatLng> _getUserLocation() async {
    final Position currentPosition = await Geolocator.getCurrentPosition();
    return LatLng(currentPosition.latitude, currentPosition.longitude);
  }

  static double _calculateDistance(LatLng start, LatLng end) {
    double lat1 = start.latitude;
    double lon1 = start.longitude;
    double lat2 = end.latitude;
    double lon2 = end.longitude;

    const R = 6371000.0; // Radius of the Earth in meters

    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  static double _toRadians(double degree) {
    return degree * (pi / 180.0);
  }
}
