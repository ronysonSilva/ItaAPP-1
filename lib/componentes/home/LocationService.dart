// LocationService.dart
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position?> getUserLocation() async {
    try {
      bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!isLocationServiceEnabled) {
        await Geolocator.openLocationSettings();
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        return position;
      } else {
        print("Permissão de localização negada.");
      }
    } catch (e) {
      print("Error getting user location: $e");
    }
    return null;
  }
}
