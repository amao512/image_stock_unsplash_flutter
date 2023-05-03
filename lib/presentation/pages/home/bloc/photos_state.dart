import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

abstract class PhotosState {}

class PhotosLoadedState extends PhotosState {
  final List<PhotoDvo> photos;

  PhotosLoadedState(this.photos);
}

class PhotosErrorState extends PhotosState {}

class PhotosLoadingState extends PhotosState {}