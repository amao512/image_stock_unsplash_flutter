import 'package:image_stock_unsplash_flutter/core/usecase/usecase.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_mapper.dart';

import '../../model/photo_dvo.dart';

class GetPhotosUseCase extends LaunchUseCase<List<PhotoDvo>> {
  final UnsplashRepository repository;

  GetPhotosUseCase({required this.repository});

  @override
  void call(
    Function(List<PhotoDvo>) onResult,
    Function(Failure) onError,
  ) {
    launch(
      block: () => repository.getPhotos(),
      result: (value) {
        onResult(value.mapPhotoToDvo());
      },
      error: (error) {
        onError(error);
      },
    );
  }
}
