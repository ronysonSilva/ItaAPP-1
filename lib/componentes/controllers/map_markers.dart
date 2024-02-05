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
        position: LatLng(-22.86972436664944, -43.78605117954447),
        icon: resizedBusIcon,
        onTap: () {
          _showMarkerInfo(
            context,
            'Rua Doutor Curvelo Cavalcanti Próximo Ao 3990',
            'Descrição do ponto 1.',
            'assets/images/pontos/biaestampa.jpg',
          );
        },
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(-22.86955482216848, -43.79304701349339),
        icon: resizedBusIcon,
        onTap: () {
          _showMarkerInfo(
            context,
            'Avenida Pref. Isoldackson Cruz de Brito, 1042',
            'Descrição do ponto 2.',
            'assets/images/pontos/biaestampa.jpg',
          );
        },
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker3'),
        position: LatLng(-22.827972276967856, -43.76008491653742),
        icon: resizedBusIcon,
        onTap: () {
          _showMarkerInfo(
            context,
            'Avenida Pref. Isoldackson Cruz de Brito, 1042',
            'Descrição do ponto 3.',
            'assets/images/pontos/biaestampa.jpg',
          );
        },
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('marker4'),
        position: LatLng(-22.818322264444916, -43.77224338451711),
        icon: resizedBusIcon,
        onTap: () {
          _showMarkerInfo(
            context,
            'Avenida Pref. Isoldackson Cruz de Brito, 1042',
            'Descrição do ponto 4.',
            'assets/images/pontos/biaestampa.jpg',
          );
        },
      ),
    );

    return markers;
  }

  static void _showMarkerInfo(BuildContext context, String markerInfo,
      String? description, String? imagePath) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
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
                        'Tempo estimado para a chegada do ônibus: 5 minutos'), // Adicione informações reais aqui
                  ],
                ),
                ExpansionTile(
                  title: Text('Tempo estimado para o Ponto'),
                  children: [
                    Text(
                        'Tempo estimado para chegar ao ponto: 10 minutos'), // Adicione informações reais aqui
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<Marker?> findNearestMarker(
      LatLng userLocation, Set<Marker> markers) async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition();
      LatLng currentLatLng =
          LatLng(currentPosition.latitude, currentPosition.longitude);

      double minDistance = double.infinity;
      Marker? nearestMarker;

      for (Marker marker in markers) {
        double distance = await Geolocator.distanceBetween(
          currentLatLng.latitude,
          currentLatLng.longitude,
          marker.position.latitude,
          marker.position.longitude,
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestMarker = marker;
        }
      }

      return nearestMarker;
    } catch (e) {
      print("Error finding nearest marker: $e");
      return null;
    }
  }

  static double calculateDistance(LatLng start, LatLng end) {
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
