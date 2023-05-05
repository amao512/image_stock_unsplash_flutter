import 'package:image_stock_unsplash_flutter/domain/model/photo_user_dvo.dart';

import 'related_collections_dvo.dart';

class PhotoDvo {
  final String id;
  final PhotoUrlDvo urls;
  final PhotoUserDvo user;
  final List<PhotoTagDvo> tags;
  final RelatedCollectionsDvo relatedCollections;

  PhotoDvo({
    required this.id,
    required this.urls,
    required this.user,
    required this.tags,
    required this.relatedCollections,
  });
}

class PhotoUrlDvo {
  final String raw;
  final String full;
  final String regular;

  PhotoUrlDvo({
    required this.raw,
    required this.full,
    required this.regular,
  });
}

class PhotoTagDvo {
  final String title;

  PhotoTagDvo({required this.title});
}
