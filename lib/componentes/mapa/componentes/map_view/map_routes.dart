import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoutesComponent extends StatelessWidget {
  final Set<Polyline> polylines;
  final List<LatLng> route1Coordinates;
  final List<LatLng> route2Coordinates;

  MapRoutesComponent({
    required this.polylines,
    required this.route1Coordinates,
    required this.route2Coordinates,
  });

  @override
  Widget build(BuildContext context) {
    _drawRoutesOnMap();
    return Container();
  }

  void _drawRoutesOnMap() {
    polylines.add(
      Polyline(
        polylineId: PolylineId('rota1'),
        color: Colors.red,
        points: route1Coordinates,
        width: 5,
      ),
    );

    polylines.add(
      Polyline(
        polylineId: PolylineId('rota2'),
        color: Colors.green,
        points: route2Coordinates,
        width: 5,
      ),
    );
  }

  static Set<Polyline> getPolylines(List<List<LatLng>> routeCoordinates,
      List<String> polylineIds, List<Color> colors) {
    Set<Polyline> polylines = {};

    for (int i = 0; i < routeCoordinates.length; i++) {
      polylines.add(
        Polyline(
          polylineId: PolylineId(polylineIds[i]),
          color: colors[i],
          points: routeCoordinates[i],
          width: 5,
        ),
      );
    }

    return polylines;
  }
}
