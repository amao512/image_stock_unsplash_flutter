import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'related_collections_entity.g.dart';

@JsonSerializable()
class RelatedCollectionsEntity {
  final List<RelatedCollectionEntity> results;

  RelatedCollectionsEntity({required this.results});

  factory RelatedCollectionsEntity.fromJson(Map<String, dynamic> json) =>
      _$RelatedCollectionsEntityFromJson(json);
}

@JsonSerializable()
class RelatedCollectionEntity {
  @JsonKey(name: "cover_photo")
  final RelatedCollectionCoverPhotoEntity coverPhoto;

  RelatedCollectionEntity({
    required this.coverPhoto,
  });

  factory RelatedCollectionEntity.fromJson(Map<String, dynamic> json) =>
      _$RelatedCollectionEntityFromJson(json);
}

@JsonSerializable()
class RelatedCollectionCoverPhotoEntity {
  final String id;
  final PhotoUrlEntity urls;

  RelatedCollectionCoverPhotoEntity({
    required this.id,
    required this.urls,
  });

  factory RelatedCollectionCoverPhotoEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RelatedCollectionCoverPhotoEntityFromJson(json);
}
