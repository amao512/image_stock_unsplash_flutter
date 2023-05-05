import 'package:image_stock_unsplash_flutter/data/models/photo_user_entity.dart';
import 'package:image_stock_unsplash_flutter/data/models/related_collections_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_entity.g.dart';

@JsonSerializable()
class PhotoEntity {
  final String? id;
  final PhotoUrlEntity? urls;
  final PhotoUserEntity? user;
  final List<PhotoTagEntity>? tags;
  @JsonKey(name: "related_collections", defaultValue: null)
  final RelatedCollectionsEntity? collections;

  PhotoEntity({
    required this.id,
    required this.urls,
    required this.user,
    required this.tags,
    required this.collections
  });

  factory PhotoEntity.fromJson(Map<String, dynamic> json) =>
      _$PhotoEntityFromJson(json);

  static Map<String, dynamic> toJson(PhotoEntity entity) => _$PhotoEntityToJson(entity);
}

@JsonSerializable()
class PhotoUrlEntity {
  final String raw;
  final String full;
  final String regular;

  PhotoUrlEntity({
    required this.raw,
    required this.full,
    required this.regular,
  });

  factory PhotoUrlEntity.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlEntityFromJson(json);
}

@JsonSerializable()
class PhotoTagEntity {
  final String title;

  PhotoTagEntity(this.title);

  factory PhotoTagEntity.fromJson(Map<String, dynamic> json) => _$PhotoTagEntityFromJson(json);
}
