import 'package:dio/dio.dart';

class NetworkClient {
  String? _baseUrlLink;

  NetworkClient({String? baseUrl}) {
    _baseUrlLink = baseUrl!;
  }
  String? get baseUrl => _baseUrlLink;
  Dio dio = Dio();
}
