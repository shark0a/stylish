
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await _dio.get(endpoint);
    return response.data;
  }
}
