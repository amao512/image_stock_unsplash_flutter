import 'package:image_stock_unsplash_flutter/data/models/search_results_entity.dart';

import '../../core/model/result_api.dart';
import '../models/photo_entity.dart';

abstract class UnsplashRepository {

  Future<ResultApi<List<PhotoEntity>>> getPhotos();

  Future<ResultApi<PhotoEntity>> getPhotoById(String photoId);

  Future<ResultApi<SearchResultsEntity>> searchPhotos(String query, int page);

  Future<List<PhotoEntity>> getFavorites();

  Future<PhotoEntity?> getFavoriteById(String imageId);

  Future<int> savePhotoToFavorite(PhotoEntity photo);

  Future<int> removeFromFavorite(String photoId);
}