import 'package:image_stock_unsplash_flutter/core/usecase/usecase.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotoById/get_photo_by_id_mapper.dart';

class GetFavoriteByIdUseCase extends LaunchUseCaseWithParam<String, PhotoDvo?> {
  final UnsplashRepository repository;

  GetFavoriteByIdUseCase(this.repository);

  @override
  void call(
    String param,
    Function(PhotoDvo? p1) result, {
    Function(Failure p1)? onError,
  }) async {
    try {
      var favorite = await repository.getFavoriteById(param);
      if (favorite != null) {
        result(mapPhotoToDvo(favorite));
      } else {
        result(null);
      }

    } catch (error) {
      onError?.call(Failure(message: "DB Error"));
    }
  }
}
