import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const RoundedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) {
          return Container(
            height: 200,
            color: Colors.grey[600],
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Image.network(
            "https://community.spotify.com/t5/image/serverpage/image-id/106208i2C0401950E6463A4/image-size/medium?v=v2&px=400",
          );
        },
      ),
    );
  }
}
