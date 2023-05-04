import 'package:image_stock_unsplash_flutter/core/utils/extensions/network_ext.dart';
import 'package:image_stock_unsplash_flutter/data/api/unsplash_api.dart';
import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';

import '../../core/model/result_api.dart';

class UnsplashRepositoryImpl extends UnsplashRepository {
  final UnsplashApi api;

  UnsplashRepositoryImpl({required this.api});

  @override
  Future<ResultApi<List<PhotoEntity>>> getPhotos() {
    return api.getPhotos().request();
  }
}