import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class PaymentController extends GetxController
{
  var phoneNumber = ''.obs;
  var address = 'Please Add Your Address'.obs;



  Future<void> updatePosition() async {

    Position position = await determinePosition() ;
    List<Placemark> placeMarks = await placemarkFromCoordinates( position.latitude, position.longitude);

    Placemark place = placeMarks[0];

    address.value = '${place.country},${place.administrativeArea},${place.subAdministrativeArea}';
  }

  /// Determine the current position of the device.

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition();
  }
}