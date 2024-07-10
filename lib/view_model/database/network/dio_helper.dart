import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: EndPoints.baseUrl, headers: {
        'Accept': 'application/json',
      }),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? data,
  }) async {
    try {
      // dio.options.headers = {};
      dio.options.headers['Authorization'] = 'Bearer $token';
      final Response response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint(
          'Get DONEEEEEEEEEE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      debugPrint(response.data.toString());
      return response;
    } catch (e) {
      debugPrint(
          'get ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      rethrow;
    }
  }

  static Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? data,
  }) async {
    try {
      // dio.options.headers = {};
      dio.options.headers['Authorization'] = 'Bearer $token';
      final Response response = await dio.delete(
        endPoint,
        queryParameters: queryParameters,
        // onReceiveProgress: onReceiveProgress,
      );
      debugPrint(
          'delete DONEEEEEEEEEE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      debugPrint(response.data.toString());
      return response;
    } catch (e) {
      debugPrint(
          'delete ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

      rethrow;
    }
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    dynamic imgData,
    String? token,
    ProgressCallback? onReceiveProgress,
    bool? img,
  }) async {
    try {
      // dio.options.headers = {};
      dio.options.headers['Authorization'] = 'Bearer $token';
      if (img != null) {
        dio.options.headers['Content-Type'] = 'multipart/form-data';
      }
      final Response response = await dio.post(
        endPoint,
        data: data ?? imgData,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint(
          'post DONEEEEEEEEEE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      // debugPrint(response.data.toString());
      return response;
    } catch (e) {
      debugPrint(
          'post ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    dynamic imgData,
    String? token,
    ProgressCallback? onReceiveProgress,
    bool? img,
  }) async {
    try {
      // dio.options.headers = {};
      dio.options.headers['Authorization'] = 'Bearer $token';
      if (img != null) {
        dio.options.headers['Content-Type'] = 'multipart/form-data';
      }
      final Response response = await dio.put(
        endPoint,
        data: data ?? imgData,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint(
          'put DONEEEEEEEEEE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      // debugPrint(response.data.toString());
      return response;
    } catch (e) {
      debugPrint(
          'put ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<Response> patchData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // dio.options.headers = {};
      dio.options.headers['Authorization'] = 'Bearer $token';

      final Response response = await dio.patch(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint(
          'Patch DONEEEEEEEEEE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      // debugPrint(response.data.toString());
      return response;
    } catch (e) {
      debugPrint(
          'Patch ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      debugPrint(e.toString());
      // return resp;
      rethrow;
    }
  }
}
