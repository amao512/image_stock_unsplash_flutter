import 'package:dio/dio.dart';
import 'package:image_stock_unsplash_flutter/core/model/result_api.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

extension FutureExt on Future<dynamic> {
  Future<ResultApi<T>> request<T>() async {
    try {
      var response = await this;

      return ResultApi.success(response);
    } catch (error) {
      return ResultApi.error(
        Failure(
          message: (error as DioError).type.name,
        ),
      );
    }
  }
}
