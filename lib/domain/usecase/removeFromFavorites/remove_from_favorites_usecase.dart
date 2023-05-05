import 'package:image_stock_unsplash_flutter/core/usecase/usecase.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';

class RemoveFromFavoritesUseCase extends LaunchUseCaseWithParam<String, Object> {
  final UnsplashRepository repository;

  RemoveFromFavoritesUseCase(this.repository);

  @override
  void call(
    String param,
    Function(Object p1) result, {
    Function(Failure p1)? onError,
  }) async {
    try {
      var success = await repository.removeFromFavorite(param);
      result(success);
    } catch (error) {
      onError?.call(Failure(message: "Delete Error"));
    }
  }
}
