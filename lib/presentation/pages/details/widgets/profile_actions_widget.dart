import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/core/ui/widgets/round_network_image.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_user_dvo.dart';

class ProfileActions extends StatelessWidget {
    final PhotoUserDvo user;

  const ProfileActions({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedNetworkImage(
          width: 48,
          height: 48,
          imageUrl: user.image.large,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 2),
              Text(
                user.username,
                style: Theme.of(context).textTheme.bodySmall,
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