import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';

class PhotoTags extends StatelessWidget {
  final List<PhotoTagDvo> tags;

  const PhotoTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tags.map((tag) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            padding: const EdgeInsets.all(8),
            child: Text(tag.title, style: Theme.of(context).textTheme.bodySmall),
          ),
        );
      }).toList(),
    );
  }
}
