import 'photo_dvo.dart';

class RelatedCollectionsDvo {
  final List<RelatedCollectionDvo> results;

  RelatedCollectionsDvo({required this.results});
}

class RelatedCollectionDvo {
  final RelatedCollectionCoverPhotoDvo coverPhoto;

  RelatedCollectionDvo({required this.coverPhoto});
}

class RelatedCollectionCoverPhotoDvo {
  final String id;
  final PhotoUrlDvo urls;

  RelatedCollectionCoverPhotoDvo({
    required this.id,
    required this.urls,
  });
}
