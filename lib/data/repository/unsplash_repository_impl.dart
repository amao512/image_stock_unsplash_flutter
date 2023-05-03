import 'package:image_stock_unsplash_flutter/data/api/unsplash_api.dart';
import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';

import '../../core/model/result_api.dart';
import '../models/failure.dart';

class UnsplashRepositoryImpl extends UnsplashRepository {
  final UnsplashApi api;

  UnsplashRepositoryImpl({required this.api});

  @override
  Future<ResultApi<List<PhotoEntity>>> getPhotos() async {
    try {
      var response = await api.getPhotos();
      
      print("response = $response");
      
      return ResultApi.success(response);
    } on Exception {
      return ResultApi.error(Failure(message: "Error when get photos!"));
    }
  }
}