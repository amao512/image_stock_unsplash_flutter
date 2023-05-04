import 'package:image_stock_unsplash_flutter/core/usecase/usecase.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

import 'get_photo_by_id_mapper.dart';

class GetPhotoByIdUseCase extends LaunchUseCaseWithParam<String, PhotoDvo> {
  final UnsplashRepository repository;

  GetPhotoByIdUseCase(this.repository);

  @override
  void call(
    String param,
    Function(PhotoDvo p1) result,
    Function(Failure p1) onError,
  ) {
    launch(
      block: () => repository.getPhotoById(param),
      result: (value) {
        result(mapPhotoToDvo(value));
      },
      error: onError,
    );
  }
}
