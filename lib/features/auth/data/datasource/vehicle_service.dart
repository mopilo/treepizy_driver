import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:treepizy_driver/core/network/network_client.dart';

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

 vehicleMake() async {
    try {
      print('repo in vehicleData.data}');
      Response vehicleData = await _networkClient.dio
          .get('${_networkClient.baseUrl}vehicle/makes',options: Options(
                headers: {
                  "Authorization": "Bearer ${SessionManager.instance.authToken}"
                },
              ));
      print('repo in ${vehicleData.data}');
      return vehicleData.data;
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return e.response?.data;
      } else {
        print(e.message);
        print("valalallala");
        return e.response?.data;
      }
    }
  }
}
