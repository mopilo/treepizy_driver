import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:treepizy_driver/core/data/session_manager.dart';
import 'package:treepizy_driver/core/network/network_client.dart';

import '../model/login_model.dart';

class AuthService {
  final NetworkClient _networkClient;
  AuthService({required NetworkClient networkService})
      : _networkClient = networkService;

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

  // Future<Either<String, LoginResponse>> login(LoginModel loginModel) async {
  //   try {
  //     Response userData = await _networkClient.dio.post(
  //         '${_networkClient.baseUrl!}school/login',
  //         data: {"mobileNo": loginModel.mobileNo, "plainPassword": loginModel.plainPassword});
  //     final loginResponse = LoginResponse.fromJson(userData.data);
  //     SessionManager.instance.authToken = loginResponse.token;
  //     SessionManager.instance.usersData=
  //         loginResponse.schoolData?.toJson() as Map<String, dynamic>;
  //     return right(LoginResponse.fromJson(userData.data));
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       String error = await checker(e.response?.statusCode, e.response?.data);
  //       return left(error.toString());
  //     } else {
  //       print(e.message);
  //       print("valalallala");
  //       return left("Make sure you're connected to an internet source");
  //     }
  //   }
  // }

  Future<Either<String, Map<dynamic, dynamic>>> register(LoginModel loginModel) async {
    try {
      Response userData = await _networkClient.dio
          .post('${_networkClient.baseUrl!}providers', data: {
        "mobileNo": loginModel.mobileNo,
        "plainPassword": loginModel.plainPassword
      });
    
      return right(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(error.toString());
      } else {
        print(e.message);
        print("valalallala");
        return left("Make sure you're connected to an internet source");
      }
    }
  }
}
