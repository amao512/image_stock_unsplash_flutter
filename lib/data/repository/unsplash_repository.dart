import '../../core/model/result_api.dart';
import '../models/photo_entity.dart';

abstract class UnsplashRepository {

  Future<ResultApi<List<PhotoEntity>>> getPhotos();

  Future<ResultApi<PhotoEntity>> getPhotoById(String photoId);

  Future<List<PhotoEntity>> getFavorites();

  Future<PhotoEntity?> getFavoriteById(String imageId);

  Future<int> savePhotoToFavorite(PhotoEntity photo);

  Future<int> removeFromFavorite(String photoId);
}