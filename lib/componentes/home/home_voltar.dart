import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  late Position _userPosition;
  String? nearestMarkerInfo;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _userPosition = position;
        _loadMarkers();
      });
    } catch (e) {
      print("Error getting user location: $e");
    }
  }

  Future<void> _loadMarkers() async {
    MapMarkers mapMarkers = MapMarkers();
    await mapMarkers.loadMarkers(context);

    setState(() {
      _markers = mapMarkers.getMarkers();
    });

    if (_userPosition != null) {
      Marker nearestMarker = _findNearestMarker(_userPosition);
      setState(() {
        nearestMarkerInfo = mapMarkers.getMarkerInfo(nearestMarker.markerId);
      });
    }
  }

  Marker _findNearestMarker(Position userPosition) {
    double minDistance = double.infinity;
    Marker nearestMarker = _markers.first;

    for (Marker marker in _markers) {
      double distance = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        marker.position.latitude,
        marker.position.longitude,
      );

      if (distance < minDistance) {
        minDistance = distance;
        nearestMarker = marker;
      }
    }

    return nearestMarker;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo à tela principal!'),
            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }

  void _showNearestMarkerModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informações do Marcador',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  nearestMarkerInfo!,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/map');
                  },
                  child: Text('Começar Agora'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MapMarkers {
  late Set<Marker> _markers = {};
  Future<BitmapDescriptor> _getResizedBusIcon() async {
    final ByteData data =
        await rootBundle.load('assets/images/ponto.png');
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

  Future<void> loadMarkers(BuildContext context) async {
    final BitmapDescriptor resizedBusIcon = await _getResizedBusIcon();

    _markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(-22.865017, -43.776749),
        icon: resizedBusIcon,
        onTap: () {
          _showMarkerInfo(context, 'Informações do Marcador 1');
        },
      ),
    );

    _markers.add(
      Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(-22.863638, -43.777120),
        icon: await _getResizedBusIcon(),
        onTap: () {
          _showMarkerInfo(context, 'Informações do Marcador 2');
        },
      ),
    );

    // Adicione mais marcadores conforme necessário...
  }

  Set<Marker> getMarkers() {
    return _markers;
  }

  String getMarkerInfo(MarkerId markerId) {
    // Implemente a lógica para obter informações do marcador
    return 'Informações do marcador $markerId';
  }

  void _showMarkerInfo(BuildContext context, String markerInfo) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            // Diminui a altura do contêiner
            height: MediaQuery.of(context).size.height * 0.3,
            // Adiciona algum afastamento da borda usando a propriedade padding
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informações do Marcador',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  markerInfo,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                // Adicione mais informações conforme necessário
              ],
            ),
          ),
        );
      },
    );
  }
}


