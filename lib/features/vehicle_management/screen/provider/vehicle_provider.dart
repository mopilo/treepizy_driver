import 'package:flutter/material.dart';

import 'package:treepizy_driver/features/vehicle_management/data/datasource/vehicle_service.dart';
import 'package:treepizy_driver/features/vehicle_management/data/model/vehicle_category_model.dart';
import 'package:treepizy_driver/features/vehicle_management/data/model/vehicle_make_details.dart';
import 'package:treepizy_driver/features/vehicle_management/data/model/vehicle_make_model.dart';
import 'package:treepizy_driver/features/vehicle_management/data/model/vehicle_success_modal.dart';

class VehicleProvider extends ChangeNotifier {
  final VehicleService vehicleService;

  VehicleProvider(this.vehicleService);

  VehicleMakeModel? get responses => _responses;
  VehicleMakeModel? _responses;
  VehicleCategoryModel? get vehicleCategory => _vehicleCategory;
  VehicleCategoryModel? _vehicleCategory;

  VehicleMakeDetails? vehicleMakeDetails;
  bool? loading = false;
  AddVehicleSuccessModal? addVehicleSuccessModal;

  void getVehicle() async {
    try {
      var vehicleResponse = await vehicleService.vehicleMake();
      _responses = vehicleResponse;
      notifyListeners();
    } catch (e) {
      print('object');
    }
  }

  void getVehicleDetails(id) async {
    print("ho");
    try {
      var vehicleResponse = await vehicleService.vehicleMakeDetail(id);
      vehicleMakeDetails = vehicleResponse;
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

  void addVehicle({year, color, plateNo, engineNo, vehicleCat, model}) async {
    try {
      loading = true;
      notifyListeners();

      var vehicleResponse = await vehicleService.addVehicle(
          year, color, plateNo, engineNo, vehicleCat, model);
      addVehicleSuccessModal = vehicleResponse;
      // print('object $_vehicleCategory');
      loading = false;
      notifyListeners();
    } catch (e) {
      print('object');
      loading = false;
      notifyListeners();
    }
  }
}
