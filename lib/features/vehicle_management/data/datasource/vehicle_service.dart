import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:treepizy_driver/core/network/network_client.dart';
import 'package:treepizy_driver/features/vehicle_management/data/model/vehicle_category_model.dart';
import 'package:treepizy_driver/features/vehicle_management/data/model/vehicle_make_model.dart';

import '../../../../core/data/session_manager.dart';

class VehicleService {
  final NetworkClient _networkClient;
  VehicleService({required NetworkClient networkClient})
      : _networkClient = networkClient;

  checker(status, response) async {
    // print(status);
    // print(response);

    if (status == 401) {
      return response["message"];
    } else if (status == 422) {
      return response["message"];
    } else if (status >= 400 && status <= 499) {
      return response["message"];
    } else {
      return 'Something went wrong';
    }
  }

  Future<VehicleMakeModel> vehicleMake() async {
    try {
      Response vehicleData =
          await _networkClient.dio.get('${_networkClient.baseUrl}vehicle/makes',
              options: Options(
                headers: {
                  "Authorization": "Bearer ${SessionManager.instance.authToken}"
                },
              ));
      return VehicleMakeModel.fromJson(vehicleData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return e.response?.data;
      } else {
        print(e.message);
        return e.response?.data;
      }
    }
  }

  Future<VehicleCategoryModel> vehicleCategory() async {
    try {
      var vehicleData = await _networkClient.dio
          .get('${_networkClient.baseUrl}vehicle/categories',
              options: Options(
                headers: {
                  "Authorization": "Bearer ${SessionManager.instance.authToken}"
                },
              ));
      return VehicleCategoryModel.fromJson(vehicleData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return e.response?.data;
      } else {
        print(e.message);
        return e.response?.data;
      }
    }
  }

  addVehicle(year, color, plateNo, engineNo, vehicleCat, model) async {
    print("${_networkClient.baseUrl}/provider/vehicle");
    try {
      var vehicleData = await _networkClient.dio
          .post('${_networkClient.baseUrl}provider/vehicles',
              data: {
                "year": int.parse(year),
                "color": color,
                "plateNo": plateNo,
                "vehicleModel": model,
                "serviceToAssociate": "string",
                "engineNo": engineNo,
                "vehicleCategory": vehicleCat
              },
              options: Options(
                headers: {
                  "Authorization": "Bearer ${SessionManager.instance.authToken}"
                },
              ));
      print(vehicleData.data);
      return vehicleData.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        String error = await checker(e.response?.statusCode, e.response?.data);
        print(error);
        return e.response?.data;
      } else {
        print(e.message);
        return e.response?.data;
      }
    }
  }
}
