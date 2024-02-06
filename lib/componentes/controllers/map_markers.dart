import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

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
    final Set<Marker> markers = {};
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
    markers.add(
      Marker(
        markerId: MarkerId('marker3'),
        position:
            LatLng(-22.872428, -43.774644), // Coordenadas do terceiro ponto
        icon: resizedBusIcon,
        onTap: () {
          _showMarkerInfo(
            context,
            'Informações do Ponto 3',
            'Descrição do ponto 3',
            'assets/images/pontos/terceira_imagem.jpg',
            LatLng(-22.872428, -43.774644), // Coordenadas do terceiro ponto
          );
        },
      ),
    );

    // Adicione outros marcadores conforme necessário

    return markers;
  }

  static void _showMarkerInfo(
    BuildContext context,
    String markerInfo,
    String? description,
    String? imagePath,
    LatLng pointCoordinates,
  ) async {
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
                        'Tempo estimado para a chegada do ônibus: 4 min e 4 s.',
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
