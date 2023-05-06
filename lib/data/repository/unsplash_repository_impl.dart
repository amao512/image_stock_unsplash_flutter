import 'package:image_stock_unsplash_flutter/core/utils/extensions/network_ext.dart';
import 'package:image_stock_unsplash_flutter/data/api/unsplash_api.dart';
import 'package:image_stock_unsplash_flutter/data/db/favorites_db.dart';
import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:image_stock_unsplash_flutter/data/models/search_results_entity.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';

import '../../core/model/result_api.dart';

class UnsplashRepositoryImpl extends UnsplashRepository {
  final UnsplashApi api;
  final FavoritesPhotoDatabase database;

  UnsplashRepositoryImpl({
    required this.api,
    required this.database,
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
  Future<ResultApi<SearchResultsEntity>> searchPhotos(String query, int page) {
    return api.searchPhotos(query, page).request();
  }

  @override
  Future<List<PhotoEntity>> getFavorites() {
    return database.getFavorites();
  }

  @override
  Future<PhotoEntity?> getFavoriteById(String imageId) {
    return database.getFavoriteById(imageId);
  }

  @override
  Future<int> removeFromFavorite(String photoId) {
    return database.deleteFromFavorites(photoId);
  }

  @override
  Future<int> savePhotoToFavorite(PhotoEntity photo) {
    return database.addToFavorite(photo);
  }
}
