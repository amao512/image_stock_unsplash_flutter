import 'package:image_stock_unsplash_flutter/core/usecase/usecase.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/saveToFavorites/save_to_favorite_mapper.dart';

class SaveToFavoritesUseCase extends LaunchUseCaseWithParam<PhotoDvo, Object> {
  final UnsplashRepository repository;

  SaveToFavoritesUseCase(this.repository);

  @override
  void call(
    PhotoDvo param,
    Function(Object p1) result, {
    Function(Failure p1)? onError,
  }) async {
    try {
      var saved = await repository.savePhotoToFavorite(mapPhotoToEntity(param));

      result(saved);
    } catch (error) {
      onError?.call(Failure(message: "Save Error"));
    }
  }
}
