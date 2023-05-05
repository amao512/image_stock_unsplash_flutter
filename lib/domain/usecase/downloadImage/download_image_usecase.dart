import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_stock_unsplash_flutter/core/usecase/usecase.dart';
import 'package:image_stock_unsplash_flutter/core/utils/random_string.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

class DownloadImageUseCase extends LaunchUseCaseWithParam<String, Object> {
  @override
  void call(
    String param,
    Function(Object p1) result, {
    Function(Failure)? onError,
  }) async {
    try {
      var response = await Dio()
          .get(param, options: Options(responseType: ResponseType.bytes));

      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: generateRandomString(),
      );

      result(result);
    } catch (error) {
      onError?.call(Failure(message: "Download error"));
    }
  }
}
