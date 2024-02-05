// map_component.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapComponent extends StatelessWidget {
  final Set<Marker> markers;
  final void Function(GoogleMapController) onMapCreated;

  MapComponent({required this.markers, required this.onMapCreated});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de Carros'),
      ),
      body: GoogleMap(
        onMapCreated: onMapCreated,
        markers: markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(-22.8665, -43.7772),
          zoom: 15.0,
        ),
      ),
    );
  }
}
