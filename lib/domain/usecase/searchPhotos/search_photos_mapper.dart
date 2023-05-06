import 'package:image_stock_unsplash_flutter/data/models/search_results_entity.dart';
import 'package:image_stock_unsplash_flutter/domain/model/search_result_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_mapper.dart';

extension SearchPhotoResultsExt on SearchResultsEntity {
  SearchResultDvo mapResultsToDvo() {
    return SearchResultDvo(
      totalPages: totalPages ?? 0,
      results: results?.mapPhotoToDvo() ?? [],
    );
  }
}