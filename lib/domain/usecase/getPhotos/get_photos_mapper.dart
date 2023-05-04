import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:image_stock_unsplash_flutter/data/models/photo_user_entity.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_user_dvo.dart';

import '../../model/photo_dvo.dart';

extension PhotoListExt on List<PhotoEntity> {
  List<PhotoDvo> mapPhotoToDvo() {
    return map((photo) => PhotoDvo(
          id: photo.id,
          urls: mapUrlToDvo(photo.urls),
          // user: mapUserToDvo(photo.user),
          // tags: mapTagsToDvo( []),
        )).toList();
  }
}

PhotoUrlDvo mapUrlToDvo(PhotoUrlEntity urls) {
  return PhotoUrlDvo(
    raw: urls.raw,
    regular: urls.regular,
    full: urls.full,
  );
}

PhotoUserDvo mapUserToDvo(PhotoUserEntity user) {
  return PhotoUserDvo(
    id: user.id,
    name: user.name,
    username: user.username,
    firstName: user.firstName,
    lastName: user.lastName,
    image: PhotoUserImageDvo(
      small: user.image.small,
      medium: user.image.medium,
      large: user.image.large,
    ),
  );
}

List<PhotoTagDvo> mapTagsToDvo(List<PhotoTagEntity> tags) {
  return tags.map((tag) => PhotoTagDvo(title: tag.title)).toList();
}
