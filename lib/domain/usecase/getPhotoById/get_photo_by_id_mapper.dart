import 'package:image_stock_unsplash_flutter/core/utils/extensions/string_ext.dart';
import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:image_stock_unsplash_flutter/data/models/related_collections_entity.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/model/related_collections_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_mapper.dart';

PhotoDvo mapPhotoToDvo(PhotoEntity photo) {
  return PhotoDvo(
    id: photo.id.orEmpty(),
    urls: mapUrlToDvo(photo.urls),
    user: mapUserToDvo(photo.user),
    tags: mapTagsToDvo(photo.tags ?? []),
    relatedCollections: mapCollectionsToDvo(photo.collections),
  );
}

RelatedCollectionsDvo mapCollectionsToDvo(
    RelatedCollectionsEntity? collections) {
  return RelatedCollectionsDvo(
    results: collections?.results.map((item) {
          return RelatedCollectionDvo(
            coverPhoto: RelatedCollectionCoverPhotoDvo(
              id: item.coverPhoto.id,
              urls: mapUrlToDvo(item.coverPhoto.urls),
            ),
          );
        }).toList() ?? [],
  );
}
