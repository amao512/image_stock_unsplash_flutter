import 'package:image_stock_unsplash_flutter/data/models/search_results_entity.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_mapper.dart';

extension SearchPhotoResultsExt on SearchResultsEntity {
  List<PhotoDvo> mapResultsToDvo() {
    return results?.mapPhotoToDvo() ?? [];
  }
}