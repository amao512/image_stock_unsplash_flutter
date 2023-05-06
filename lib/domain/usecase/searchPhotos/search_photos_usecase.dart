import 'package:image_stock_unsplash_flutter/core/usecase/usecase.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';
import 'package:image_stock_unsplash_flutter/domain/model/search_photo_param.dart';
import 'package:image_stock_unsplash_flutter/domain/model/search_result_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/searchPhotos/search_photos_mapper.dart';

class SearchPhotosUseCase
    extends LaunchUseCaseWithParam<SearchPhotoParam, SearchResultDvo> {
  final UnsplashRepository repository;

  SearchPhotosUseCase(this.repository);

  @override
  void call(SearchPhotoParam param, Function(SearchResultDvo p1) result,
      {Function(Failure p1)? onError}) {
    launch(
      block: () => repository.searchPhotos(param.query, param.page),
      result: (value) {
        result(value.mapResultsToDvo());
      },
      error: (failure) => onError?.call(failure),
    );
  }
}
