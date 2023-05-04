import 'package:dio/dio.dart';

class ApiException extends DioError {

  ApiException({required super.requestOptions, required super.message});
}