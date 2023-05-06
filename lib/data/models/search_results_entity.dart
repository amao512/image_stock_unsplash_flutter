import 'package:json_annotation/json_annotation.dart';

import 'photo_entity.dart';

part 'search_results_entity.g.dart';

@JsonSerializable()
class SearchResultsEntity {
  final int? total;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  final List<PhotoEntity>? results;

  SearchResultsEntity({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchResultsEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsEntityFromJson(json);
}
