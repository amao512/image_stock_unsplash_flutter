import 'package:image_stock_unsplash_flutter/core/utils/extensions/network_ext.dart';
import 'package:image_stock_unsplash_flutter/data/api/unsplash_api.dart';
import 'package:image_stock_unsplash_flutter/data/db/favorites_db.dart';
import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';

import '../../core/model/result_api.dart';

class UnsplashRepositoryImpl extends UnsplashRepository {
  final UnsplashApi api;
  final FavoritesPhotoDataSource dataSource;

  UnsplashRepositoryImpl({
    required this.api,
    required this.dataSource,
  });

  @override
  Future<ResultApi<List<PhotoEntity>>> getPhotos() {
    return api.getPhotos().request();
  }

  @override
  Future<ResultApi<PhotoEntity>> getPhotoById(String photoId) {
    return api.getPhotoById(photoId).request();
  }

  @override
  List<PhotoEntity> getFavorites() {
    return dataSource.getPhotos();
  }

  @override
  void removeFromFavorite(String photoId) {
    dataSource.removePhoto(photoId);
  }

  @override
  void savePhotoToFavorite(PhotoEntity photo) {
    dataSource.savePhoto(photo);
  }
}
