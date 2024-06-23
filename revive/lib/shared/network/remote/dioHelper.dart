import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:revive/shared/network/end_point.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
         // baseUrl: "https://student.valuxapps.com/api/",
          baseUrl: "$server",
          receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": "application/json",
          }),
    );
  }

  static Future<Response> getData({
    @required String? url,
    Map<String, dynamic>? query,
    String? token,
    String lang = "en",
  }) async {
    dio!.options.headers = {
      "lang": lang,
      "Authorization": token,
    };
    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String? url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? token,
    String lang = "en",
  }) async {
    dio!.options.headers = {
      "lang": lang,
      "Authorization": token,
    };
    return dio!.post(
      url!,
      queryParameters: query,
      data: data,
    );
  }

static Future<Response> post2Data({
    required String url,
    dynamic data, // Changed from Map<String, dynamic>? to dynamic
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio!.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> PutData({
    @required String? url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? token,
    String lang = "en",
  }) async {
    dio!.options.headers = {
      "lang": lang,
      "Authorization": token,
    };
    return dio!.put(
      url!,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> DeleteData({
    @required String? url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? token,
    String lang = "en",
  }) async {
    dio!.options.headers = {
      "lang": lang,
      "Authorization": token,
    };
    return dio!.delete(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getAdminData({
    @required String? url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? token,
    String lang = "en",
  }) async {
    dio!.options.headers = {
      "lang": lang,
      "Authorization": token,
    };
    return dio!.get(
      url!,
      queryParameters: query,
      data: data,
    );
  }
}
