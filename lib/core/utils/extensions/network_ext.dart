import 'package:image_stock_unsplash_flutter/core/model/api_exception.dart';
import 'package:image_stock_unsplash_flutter/core/model/result_api.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

extension FutureExt on Future<dynamic> {
  Future<ResultApi<T>> request<T>() async {
    try {
      var response = await this;

      return ResultApi.success(response);
    } catch (error) {
      if (error is ApiException) {
        return ResultApi.error(
          Failure(
            message: error.message ?? "Internal Server Error",
          ),
        );
      } else {
        return ResultApi.error(
          Failure(
            message: "Internal Server Error",
          ),
        );
      }
    }
  }
}
