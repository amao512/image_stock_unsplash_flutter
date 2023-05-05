import 'package:image_stock_unsplash_flutter/core/usecase/usecase.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_mapper.dart';

class GetFavoritesUseCase extends LaunchUseCase<List<PhotoDvo>> {
  final UnsplashRepository repository;

  GetFavoritesUseCase(this.repository);

  @override
  void call(
    Function(List<PhotoDvo> p1) onResult, {
    Function(Failure p1)? onError,
  }) async {
    try {
      var favorites = await repository.getFavorites();
      onResult(favorites.mapPhotoToDvo());
    } catch (error) {
      onError?.call(Failure(message: "DB Error!"));
    }
  }
}
