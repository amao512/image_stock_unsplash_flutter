import 'package:image_stock_unsplash_flutter/core/bloc/base_state.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

abstract class PhotosState extends BaseBlocState {}

class PhotosLoadedState extends PhotosState {
  final List<PhotoDvo> photos;

  PhotosLoadedState(this.photos);
}

class PhotosLoadingState extends PhotosState {}