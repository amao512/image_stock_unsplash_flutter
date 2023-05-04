import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/core/ui/base_state.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_state.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/widgets/profile_actions_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/widgets/similar_photos_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/widgets/tags_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/image_card_widget.dart';

class PhotoDetailsPage extends StatefulWidget {
  final String photoId;

  const PhotoDetailsPage({required this.photoId, super.key});

  @override
  State<StatefulWidget> createState() => PhotoDetailsState();
}

class PhotoDetailsState extends BaseState<PhotoDetailsPage, PhotoDetailsCubit,
    PhotoDetailsBlocState> {
  @override
  PhotoDetailsCubit createBloc(BuildContext context) {
    return getIt<PhotoDetailsCubit>()..loadPhotoById(widget.photoId);
  }

  @override
  Widget buildWidget(BuildContext context, PhotoDetailsBlocState result) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                photoDetails(result),
                const SizedBox(height: 32),
                const Text(
                  "Похожие фотографии",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SimiliarPhotos(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget photoDetails(PhotoDetailsBlocState result) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        const ProfileActions(
          profileImage: "https://s8.vcdn.biz/static/f/5864270381/image.jpg",
        ),
        const SizedBox(height: 24),
        ImageCard(
          imageUrl: result.photo.urls.regular,
          onTap: () {},
        ),
        const SizedBox(height: 24),
        const Text(
          "Похожие теги",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        PhotoTags(),
      ],
    );
  }
}
