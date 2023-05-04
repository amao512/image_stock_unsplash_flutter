import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/core/ui/widgets/round_network_image.dart';

class ProfileActions extends StatelessWidget {
    final String profileImage;

  const ProfileActions({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const RoundedNetworkImage(
          width: 48,
          height: 48,
          imageUrl: "https://s8.vcdn.biz/static/f/5864270381/image.jpg",
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Shrek",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 2),
              Text(
                "@shrek",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ),
        Card(
          color: Colors.green[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.download, color: Colors.white,)
          ),
        ),
      ],
    );
  }
}