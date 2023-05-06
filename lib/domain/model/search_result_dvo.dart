import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

class SearchResultDvo {
  final int totalPages;
  final List<PhotoDvo> results;

  SearchResultDvo({
    required this.totalPages,
    required this.results,
  });
}
