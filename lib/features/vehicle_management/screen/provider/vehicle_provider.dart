import 'package:flutter/material.dart';

import 'package:treepizy_driver/features/vehicle_management/data/datasource/vehicle_service.dart';
import 'package:treepizy_driver/features/vehicle_management/data/model/vehicle_category_model.dart';

class VehicleProvider extends ChangeNotifier {
  final VehicleService vehicleService;

  VehicleProvider(this.vehicleService);

  dynamic get responses => _responses;
  dynamic _responses;
  VehicleCategoryModel? get vehicleCategory => _vehicleCategory;
  VehicleCategoryModel? _vehicleCategory;

  void getVehicle() async {
    try {
      var vehicleResponse = await vehicleService.vehicleMake();
      _responses = vehicleResponse;
      notifyListeners();
    } catch (e) {
      print('object');
    }
  }

  void getVehicleCategory() async {
    try {
      var vehicleResponse = await vehicleService.vehicleCategory();
      _vehicleCategory = vehicleResponse;
      print('object $_vehicleCategory');
      notifyListeners();
    } catch (e) {
      print('object');
    }
  }
}
