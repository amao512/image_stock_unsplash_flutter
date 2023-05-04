import 'package:json_annotation/json_annotation.dart';

part 'photo_entity.g.dart';

@JsonSerializable()
class PhotoEntity {
  final String id;
  final PhotoUrlEntity urls;

  PhotoEntity({
    required this.id,
    required this.urls,
  });

  factory PhotoEntity.fromJson(Map<String, dynamic> json) => _$PhotoEntityFromJson(json);
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

  factory PhotoUrlEntity.fromJson(Map<String, dynamic> json) => _$PhotoUrlEntityFromJson(json);
}
