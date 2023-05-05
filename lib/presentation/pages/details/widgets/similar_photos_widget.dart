import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/domain/model/related_collections_dvo.dart';
import 'package:image_stock_unsplash_flutter/presentation/common/widgets/image_card_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class SimilarPhotos extends StatelessWidget {
  final RelatedCollectionsDvo photos;

  const SimilarPhotos({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Column(children: photos.results.map((photo) {
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: ImageCard(
          imageUrl: photo.coverPhoto.urls.raw,
          onTap: () {
            context.push(Routes.details, extra: photo.coverPhoto.id);
          },
        ),
      );
    }).toList());
  }
}
