import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

class SearchPhotoState {
  final int totalPages;
  final List<PhotoDvo> photos;

  SearchPhotoState(this.totalPages, this.photos);
}