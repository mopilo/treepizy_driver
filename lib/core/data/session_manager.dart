import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// A class for managing sessions, handles saving and retrieving of data
class SessionManager {
  SessionManager._internal();

  SharedPreferences? sharedPreferences;

  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  static SessionManager get instance => _instance;

  Future<void> initializeSession() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String keyAuthToken = 'auth_token';
  static const String keyUserData = 'users_data';
  static const String keyUserPhoto = 'users_photo';

  static const String loginKey = 'login';
  static const String userIdKey = 'userIdKey';
  static const String checkOnBoarding = 'on_boarding';

  String get authToken => sharedPreferences!.getString(keyAuthToken) ?? '';
  int get userId => sharedPreferences!.getInt(userIdKey) ?? 0;

  bool get authLogging => sharedPreferences!.getBool(loginKey) ?? false;

  bool get isOnBoarding => sharedPreferences!.getBool(checkOnBoarding) ?? false;

  set authLogging(bool logging) =>
      sharedPreferences!.setBool(loginKey, logging);

  set isOnBoarding(bool value) =>
      sharedPreferences!.setBool(checkOnBoarding, value);

  set authToken(String? authToken) =>
      sharedPreferences!.setString(keyAuthToken, authToken!);

  set userId(int userId) => sharedPreferences!.setInt(userIdKey, userId);

  Map<String, dynamic> get usersData =>
      json.decode(sharedPreferences!.getString(keyUserData) ?? '');
  Map<String, dynamic> get usersPhoto =>
      json.decode(sharedPreferences!.getString(keyUserPhoto) ?? '');

  set usersData(Map<String, dynamic> map) =>
      sharedPreferences!.setString(keyUserData, json.encode(map));

  set usersPhoto(Map<String, dynamic> map) =>
      sharedPreferences!.setString(keyUserPhoto, json.encode(map));

  // Future<bool> logOut() async {
  //   await sharedPreferences!.clear();
  //   try {
  //     final cacheDir = await getTemporaryDirectory();
  //     if (cacheDir.existsSync()) {
  //       cacheDir.deleteSync(recursive: true);
  //     }
  //     final appDir = await getApplicationSupportDirectory();
  //     if (appDir.existsSync()) {
  //       appDir.deleteSync(recursive: true);
  //     }
  //   } catch (e) {
  //     logger.d("error clearing cache");
  //   }
  //   return true;
  // }
}
