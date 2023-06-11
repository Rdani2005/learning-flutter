import 'dart:typed_data';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CoffeeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Url
    _dio.options.baseUrl = "http://localhost:8080/api";

    // Headers config.
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);

      return response.data;
    } catch (e) {
      throw ('Error handling http get request.');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final FormData formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);

      return response.data;
    } catch (e) {
      throw ('Error handling http post request.');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final FormData formData = FormData.fromMap(data);
    try {
      final response = await _dio.put(path, data: formData);

      return response.data;
    } catch (e) {
      throw ('Error handling http put request.');
    }
  }

  static Future httpUploadFile(String path, Uint8List bytes) async {
    final FormData formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(bytes),
    });
    try {
      final response = await _dio.put(path, data: formData);

      return response.data;
    } catch (e) {
      throw ('Error handling http put request.');
    }
  }

  static Future httpDelete(String path) async {
    try {
      final response = await _dio.delete(path);

      return response.data;
    } catch (e) {
      throw ('Error handling http delete request.');
    }
  }
}
