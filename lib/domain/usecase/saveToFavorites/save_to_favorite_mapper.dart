import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

PhotoEntity mapPhotoToEntity(PhotoDvo photo) {
  return PhotoEntity(
    id: photo.id,
    urls: PhotoUrlEntity(
      full: photo.urls.full,
      raw: photo.urls.raw,
      regular: photo.urls.regular
    ),
    user: null,
    tags: null,
    collections: null
  );
}
