import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/core/ui/widgets/round_network_image.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final Function? onTap;

  const ImageCard({super.key, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: RoundedNetworkImage(
        width: double.infinity,
        imageUrl: imageUrl,
      ),
    );
  }
}
