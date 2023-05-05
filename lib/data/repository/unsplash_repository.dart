import '../../core/model/result_api.dart';
import '../models/photo_entity.dart';

abstract class UnsplashRepository {

  Future<ResultApi<List<PhotoEntity>>> getPhotos();

  Future<ResultApi<PhotoEntity>> getPhotoById(String photoId);

  List<PhotoEntity> getFavorites();

  void savePhotoToFavorite(PhotoEntity photo);

  void removeFromFavorite(String photoId);
}