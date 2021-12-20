import 'package:geolocator/geolocator.dart';

class MyLocation{
  double? latitude;
  double? longitude;

  Future<void> getMyCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return print('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return print('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return print('Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;
  }
}