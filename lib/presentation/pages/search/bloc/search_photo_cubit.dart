import 'package:image_stock_unsplash_flutter/core/bloc/base_cubit.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/model/search_photo_param.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/searchPhotos/search_photos_usecase.dart';

import 'search_photo_state.dart';

class SearchPhotoCubit extends BaseCubit<SearchPhotoState> {
  final SearchPhotosUseCase searchPhotosUseCase;

  SearchPhotoCubit(this.searchPhotosUseCase);

  void onSearch(String query) {
    var param = SearchPhotoParam(query: query, page: 1);

    searchPhotosUseCase(
      param,
      (result) =>
          emitState(SearchPhotoState(result.totalPages, result.results)),
      onError: (error) => emitError(error),
    );
  }

  void loadMore(String query, int page, Function(List<PhotoDvo>) onResult) {
    var param = SearchPhotoParam(query: query, page: page);

    searchPhotosUseCase(
      param,
      (result) => onResult(result.results),
      onError: (error) => emitError(error),
    );
  }
}
