// MapWidget.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  final Set<Marker> markers;
  final Position userPosition;

  MapWidget({required this.markers, required this.userPosition});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      initialCameraPosition: CameraPosition(
        target: LatLng(userPosition.latitude, userPosition.longitude),
        zoom: 15,
      ),
    );
  }
}
