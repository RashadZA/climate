import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  double? latitude;
  double? longtitude;

  Future<void> getCurrentLocation() async {
    try {
      // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> permision = await [
        Permission.location,
      ].request();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longtitude = position.longitude;
    }
    catch(e){
      print(e);
    }

  }
}