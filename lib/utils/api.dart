import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:practice_api/utils/constance.dart';

class ApiException implements Exception {
  String errorMessage;

  ApiException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class ApiCall {
  static Map<String, dynamic> headers() {
    String jwtToken = "20000";

    return {
      "Authorization": "Bearer $jwtToken",
      "Accept": "application/json",
    };
  }

  static String loginurl = "${databaseUrl}student/login";

  Future<Map<String, dynamic>> postapi(
      {required String url,
      required Map<String, dynamic> body,
      required bool useAuthtoken}) async {
    try {
      final Dio dio = Dio();
      final FormData formData =
          FormData.fromMap(body, ListFormat.multiCompatible);

      print("API Called POST: $url with $body");
      print("Body Params: $body");

      final response = await dio.post(url,
          data: formData,
          options: useAuthtoken ? Options(headers: headers()) : null);

      print("Response: $response");

      if (response.data['error']) {
        throw ApiException(response.data['code'].toString());
      }
      return response.data;
    } on DioException catch (e) {
      ApiException(e.toString());
    } on ApiException catch (e) {
      throw ApiException(e.toString());
    } catch (e) {
      throw ApiException(e.toString());
    }
    return Map.from({});
  }
}
