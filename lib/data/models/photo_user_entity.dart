import 'package:json_annotation/json_annotation.dart';

part 'photo_user_entity.g.dart';

@JsonSerializable()
class PhotoUserEntity {
  final String id;
  final String name;
  final String username;
  @JsonKey(name: "profile_image")
  final PhotoUserImageEntity image;

  PhotoUserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.image,
  });

  factory PhotoUserEntity.fromJson(Map<String, dynamic> json) => _$PhotoUserEntityFromJson(json);
}

@JsonSerializable()
class PhotoUserImageEntity {
  final String small;
  final String medium;
  final String large;

  PhotoUserImageEntity({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory PhotoUserImageEntity.fromJson(Map<String, dynamic> json) => _$PhotoUserImageEntityFromJson(json);
}