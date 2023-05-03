import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';

import '../../model/photo_dvo.dart';

List<PhotoDvo> mapPhotoToDvo(List<PhotoEntity> photos) {
  return photos
      .map((photo) => PhotoDvo(
            id: photo.id,
            urls: mapUrlToDvo(photo.urls),
          ))
      .toList();
}

PhotoUrlDvo mapUrlToDvo(PhotoUrlEntity urls) {
  return PhotoUrlDvo(
    raw: urls.raw,
    regular: urls.regular,
    full: urls.full,
  );
}
