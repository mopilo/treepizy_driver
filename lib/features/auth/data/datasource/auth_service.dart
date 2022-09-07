import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:treepizy_driver/core/data/session_manager.dart';
import 'package:treepizy_driver/core/network/network_client.dart';
import 'package:treepizy_driver/features/auth/data/model/change_password_model.dart';
import 'package:treepizy_driver/features/auth/data/model/modify_user_model.dart';
import 'package:http/http.dart' as http;

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

  Future<Either<String, Map<dynamic, dynamic>>> login(
      LoginModel loginModel) async {
    try {
      Response userData = await _networkClient.dio
          .post('${_networkClient.baseUrl!}providers/login', data: {
        "mobileNo": loginModel.mobileNo,
        "plainPassword": loginModel.plainPassword
      });

      var result = userData.data["token"];
      SessionManager.instance.authToken = result;

      return right(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);

        String error = await checker(e.response?.statusCode, e.response?.data);
        print(error);
        return left(error.toString());
      } else {
        print(e.message);
        print("valalallala");
        return left("Make sure you're connected to an internet source");
      }
    }
  }

  Future<Either<String, Map<dynamic, dynamic>>> register(
      LoginModel loginModel) async {
    try {
      Response userData = await _networkClient.dio
          .post('${_networkClient.baseUrl!}providers', data: {
        "mobileNo": loginModel.mobileNo,
        "plainPassword": loginModel.plainPassword
      });
      var result = userData.data["token"];

      SessionManager.instance.authToken = result;
      return right(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(error.toString());
      } else {
        print(e.message);
        print("valalallala");
        return left("Make sure you're connected to an internet source");
      }
    }
  }

  Future<Either<Exception, Map<dynamic, dynamic>>> otpValidation(otp) async {
    Map user;
    try {
      Response userData = await _networkClient.dio
          .post('${_networkClient.baseUrl!}providers/verify',
              data: {
                "otp": otp,
              },
              options: Options(
                headers: {
                  "Authorization": "Bearer ${SessionManager.instance.authToken}"
                },
              ));
      user = userData.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.statusCode);
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(Exception(error));
      } else {
        return left(Exception('Something went wrong'));
      }
    }
    return right(user);
  }

  Future<Either<Exception, Map<dynamic, dynamic>>> resetPassword(tel) async {
    Map resetInfo;

    try {
      Response resetData = await _networkClient.dio.post(
        '${_networkClient.baseUrl!}providers/password/reset',
        data: {"channel": "sms", "mobileNo": tel},
      );
      print(resetData.data);
      resetInfo = resetData.data;
      return right(resetInfo);
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(Exception(error));
      } else {
        return left(Exception('Something went wrong'));
      }
    }
  }

  Future<Either<Exception, Map<dynamic, dynamic>>> changePassword(
      ChangePasswordModel changePasswordModel) async {
    Map user;
    print({
      "currentPassword": changePasswordModel.currentPassword,
      "newPassword": changePasswordModel.newPassword
    });
    try {
      Response userData = await _networkClient.dio
          .post('${_networkClient.baseUrl}providers/password/change',
              data: {
                "currentPassword": changePasswordModel.currentPassword,
                "newPassword": changePasswordModel.newPassword
              },
              options: Options(
                headers: {
                  "Authorization": "Bearer ${SessionManager.instance.authToken}"
                },
              ));
      print(userData.data);
      user = userData.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print("error");
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(Exception(error));
      } else {
        return left(Exception('Something went wrong ¯\_(ツ)_/¯'));
      }
    }
    return right(user);
  }

  Future<Either<Exception, Map<dynamic, dynamic>>> resendOtp() async {
    Map user;

    try {
      Response userData = await _networkClient.dio
          .post('${_networkClient.baseUrl}providers/email/otp/resend',
              options: Options(
                headers: {
                  "Authorization": "Bearer ${SessionManager.instance.authToken}"
                },
              ));
      print(userData.data);
      user = userData.data;
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(Exception(error));
      } else {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(Exception(error));
        return left(Exception('Something went wrong ¯\_(ツ)_/¯'));
      }
    }
    return right(user);
  }

  Future<Either<Exception, Map<dynamic, dynamic>>> modifyUser(
      ModifyUserModel modifyUserModel) async {
    Map user;
    try {
      Response userData = await _networkClient.dio
          .put('${_networkClient.baseUrl}providers/modify',
              data: {
                "firstName": modifyUserModel.firstName,
                "lastName": modifyUserModel.lastName,
                "email": modifyUserModel.email,
              },
              options: Options(
                headers: {
                  "Authorization": "Bearer ${SessionManager.instance.authToken}"
                },
              ));
      user = json.decode(userData.data);
      print(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(Exception(error));
      } else {
        return left(Exception('Something went wrong'));
      }
    }
    return right(user);
  }

  Future<Either<Exception, Map<dynamic, dynamic>>> modifyUserAvatar(
      file) async {
    Map result;
    print(file!.path);
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${_networkClient.baseUrl}provider/photos/upload'));

      //Header....
      request.headers['Authorization'] =
          'Bearer ${SessionManager.instance.authToken}';
      request.files.add(await http.MultipartFile.fromPath('file', file!.path));
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      result = json.decode(res.body);
      print(result);
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(Exception(error));
      } else {
        return left(Exception('Something went wrong'));
      }
    }
    return right(result);
  }

  Future<Either<Exception, Map<dynamic, dynamic>>> uploadCertificate(
      file, id) async {
    Map result;
    print(file!.path);
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse('${_networkClient.baseUrl!}vehicle/certificates/upload'));

      //Header....
      request.headers['Authorization'] =
          'Bearer ${SessionManager.instance.authToken}';
      request.files.add(await http.MultipartFile.fromPath('file', file!.path));
      request.fields['vehicle'] = id;
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      result = json.decode(res.body);
      print(result);
    } on DioError catch (e) {
      if (e.response != null) {
        String error = await checker(e.response?.statusCode, e.response?.data);
        return left(Exception(error));
      } else {
        return left(Exception('Something went wrong'));
      }
    }
    return right(result);
  }
}
