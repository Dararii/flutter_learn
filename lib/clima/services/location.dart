import 'package:geolocator/geolocator.dart';

class LocationEngine {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print("Get current location called $position");
    } catch (e) {
      print(e);
    }
  }
}
