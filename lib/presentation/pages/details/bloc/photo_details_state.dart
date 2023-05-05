import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

class PhotoDetailsBlocState {
  final PhotoDvo photo;
  final bool isFavorite;

  PhotoDetailsBlocState(this.photo, this.isFavorite);
}