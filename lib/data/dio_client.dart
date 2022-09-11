import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tentwenty/constants/api_contants.dart';

class DioClient {
  DioClient._privateConstructor();
  static final DioClient instance = DioClient._privateConstructor();
  final Dio _dio = Dio()
    ..options.baseUrl = APIConstants.baseURL
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000;
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
