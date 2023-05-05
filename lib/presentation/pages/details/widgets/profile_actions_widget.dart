import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/core/ui/widgets/round_network_image.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_user_dvo.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_state.dart';

class ProfileActions extends StatefulWidget {
  final PhotoDetailsBlocState state;
  final Function(bool) onFavourite;
  final Function() onDownload;

  const ProfileActions({
    super.key,
    required this.state,
    required this.onFavourite,
    required this.onDownload,
  });

  @override
  State<StatefulWidget> createState() => _ProfileActions();
}

class _ProfileActions extends State<ProfileActions> {
  bool isFavorite = false;
  PhotoUserDvo? user;

  @override
  void initState() {
    user = widget.state.photo.user;
    isFavorite = widget.state.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedNetworkImage(
          width: 48,
          height: 48,
          imageUrl: user?.image.large ?? '',
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.name ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 2),
              Text(
                user?.username ?? '',
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
            onPressed: () {
              widget.onFavourite(isFavorite);
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.black),
          ),
        ),
        Card(
          color: Colors.green[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {
              widget.onDownload();
            },
            icon: const Icon(Icons.download, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
