import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';


enum HomeEnum { initial, busy, idle }

class HomeProvider extends ChangeNotifier {
  HomeEnum homeEnum = HomeEnum.initial;
  String? progress = "";
  String? moveProgress = "";
  String? type;
  List<Location>? destionLocations;

  final loc.Location locationService = loc.Location();
  loc.LocationData? initialLocation;
  loc.LocationData? currentLocation;
  loc.PermissionStatus? _permissionGranted;
  String error = "";
  String? startAddress;
  String? destinationAddress;
  List result = [];

  HomeProvider();
  final sessionToken = const Uuid().v4();

  void updateValue(val) {
    progress = val;
    notifyListeners();
  }

  void updateMoveStatus(val) {
    moveProgress = val;
    notifyListeners();
  }

  void updateType(val) {
    type = val;
    notifyListeners();
  }

  

 

 

  
  obtainPermission(context) async {
    // await _locationService.changeSettings(
    //     accuracy: loc.LocationAccuracy.high, interval: 3000);

    // loc.LocationData? locationData;
    // print(await Permission.location.request().isGranted);
    if (!await Permission.location.request().isGranted) {
      return false;
    }
    notifyListeners();

    // _locationService.changeSettings(
    //     accuracy: loc.LocationAccuracy.powerSave, interval: 4000);
    //
    // bool _serviceEnabled = await _locationService.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await _locationService.requestService();
    //   notifyListeners();
    //   if (!_serviceEnabled) {
    //     return false;
    //   }
    // }

    var _permissionGranted = await locationService.hasPermission();
    bool _serviceEnabled = await locationService.serviceEnabled();

    if (_permissionGranted != PermissionStatus.granted || !_serviceEnabled) {
      ///asks permission and enable location dialogs
      _permissionGranted = await locationService.requestPermission();

      _serviceEnabled = await locationService.requestService();
    } else {
      ///Do something here
    }

    initialLocation = await locationService.getLocation();
    print(initialLocation);

    currentLocation = initialLocation;
    notifyListeners();
    locationService.changeSettings(
        accuracy: loc.LocationAccuracy.powerSave, interval: 10000);

    // locationService.onLocationChanged
    //     .listen((loc.LocationData presentLocation) {
    //   // Use current location
    //   currentLocation = presentLocation;
    //   print(currentLocation);
    //   notifyListeners();
    //   print("hg");
    //   reviewUsersLocation(
    //       longitude: presentLocation.latitude!,
    //       latitude: presentLocation.longitude!,
    //       accuracyRadius: 10000);
    // });
    await getAddress();

    // try {
    //   bool serviceEnabled = await _locationService.serviceEnabled();
    //   if (serviceEnabled) {
    //     loc.PermissionStatus p;
    //
    //     if (_permissionGranted == PermissionStatus.denied) {
    //       _permissionGranted = (await _locationService.requestPermission());
    //       if (_permissionGranted == PermissionStatus.granted) {
    //         locationData = await _locationService.getLocation();
    //         currentLocation = locationData;
    //         notifyListeners();
    //
    //         await _locationService.changeSettings(
    //             accuracy: loc.LocationAccuracy.high, interval: 3000);
    //
    //         _locationService.onLocationChanged
    //             .listen((LocationData currentLocation) {
    //           // Use current location
    //           currentLocation = currentLocation;
    //           // notifyListeners();
    //           print("hg");
    //           reviewUsersLocation(
    //               longitude: currentLocation.latitude!,
    //               latitude: currentLocation.longitude!,
    //               accuracyRadius: 1000);
    //         });
    //         notifyListeners();
    //         await getAddress();
    //       } else {
    //         return;
    //       }
    //     }
    //   } else {
    //     bool serviceRequestGranted = await _locationService.requestService();
    //     if (!serviceRequestGranted) {
    //       // initPlatformState();
    //       return;
    //     }
    //   }
    // } on PlatformException catch (e) {
    //   print(e);
    //   if (e.code == 'PERMISSION_DENIED') {
    //     error = e.message!;
    //     notifyListeners();
    //   } else if (e.code == 'SERVICE_STATUS_ERROR') {
    //     error = e.message!;
    //     notifyListeners();
    //   }
    // }
  }

  getAddress() async {
    try {
      // Places are retrieved using the coordinates
      List<Placemark> p = await placemarkFromCoordinates(
          currentLocation!.latitude!, currentLocation!.longitude!);

      // Taking the most probable result
      // Placemark place = p[0];
      startAddress = "${p.first.street}, ${p.first.locality}";
      notifyListeners();
    } catch (e) {
    }
  }

  Future<String> getWithPointsAddress({String? lat, String? lon}) async {
    // Places are retrieved using the coordinates
    List<Placemark> p =
        await placemarkFromCoordinates(double.parse(lat!), double.parse(lon!));

    return "${p.first.street}, ${p.first.locality}";
  }

  getLatLon({required String address}) async {
    try {
      // locations are retrieved using the coordinates
      List<Location> locations = await locationFromAddress(address);

      // Taking the most probable result
      if (locations.isNotEmpty) {
        destionLocations = locations;
        notifyListeners();
      }
    } catch (e) {
    }
  }

}
