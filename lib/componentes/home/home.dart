/*import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'LocationService.dart';
import 'MarkerInfoModal.dart';
import '../controllers/map_markers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Position _userPosition;
  bool _isLoading = false;
  Set<Marker> _markers = {};
  String? nearestMarkerInfo;

  late GoogleMapController _mapController; // Use GoogleMapController

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      setState(() {
        _isLoading = true;
      });

      Position? position = await LocationService.getUserLocation();

      if (position != null) {
        setState(() {
          _userPosition = position;
          _loadMarkers();
        });
      } else {
        print("Error getting user location.");
      }
    } catch (e) {
      print("Error getting user location: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMarkers() async {
    Set<Marker> markers = await MapMarkers.getMarkers(context);

    setState(() {
      _markers = markers;
    });

    print("Markers Count: ${_markers.length}");

    if (_userPosition != null && _markers.isNotEmpty) {
      Marker nearestMarker = _findNearestMarker(_userPosition);
      setState(() {
        nearestMarkerInfo = MapMarkers.getMarkerInfo(nearestMarker.markerId);
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

    print("Nearest Marker Position: ${nearestMarker.position}");

    return nearestMarker;
  }

  void _showNearestMarkerModal() {
    if (nearestMarkerInfo != null) {
      MarkerInfoModal.show(context, nearestMarkerInfo!, () {
        // Handle the modal closed callback if needed
      });
    } else {
      print("Aguardando informações do marcador mais próximo...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(_userPosition.latitude, _userPosition.longitude),
                zoom: 15.0,
              ),
              markers: _markers,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _getUserLocation().then((_) {
                if (!_isLoading) {
                  _showNearestMarkerModal();
                }
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
            child: _isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    'Ponto mais próximo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
          SizedBox(height: 20),
          if (nearestMarkerInfo != null)
            Text(
              'Informações do ponto mais próximo: $nearestMarkerInfo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}
*/