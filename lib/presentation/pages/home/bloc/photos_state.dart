import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

class PhotosState {}

class PhotosLoadedState extends PhotosState {
  final List<PhotoDvo> photos;

  PhotosLoadedState(this.photos);
}