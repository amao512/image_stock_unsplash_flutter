import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_mapper.dart';

PhotoDvo mapPhotoToDvo(PhotoEntity photo) {
  return PhotoDvo(
    id: photo.id,
    urls: mapUrlToDvo(photo.urls),
    // user: mapUserToDvo(photo.user),
    // tags: mapTagsToDvo( []),
  );
}
