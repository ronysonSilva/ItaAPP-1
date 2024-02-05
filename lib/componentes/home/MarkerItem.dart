// MarkerItem.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerItem {
  final String markerId;
  final LatLng position;
  final BitmapDescriptor icon;
  final Function onTap;

  MarkerItem({required this.markerId, required this.position, required this.icon, required this.onTap});
}
