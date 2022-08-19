import 'package:flutter/material.dart';

import 'package:treepizy_driver/features/auth/data/datasource/vehicle_service.dart';

class VehicleProvider extends ChangeNotifier {
  final VehicleService vehicleService;

  VehicleProvider(this.vehicleService);

  dynamic get responses => _responses;
  dynamic _responses;

  void getVehicle() async {
    try {
      var vehicleResponse = await vehicleService.vehicleMake();
      _responses = vehicleResponse;
      notifyListeners();
    } catch (e) {
      print('object');
    }
  }
}
