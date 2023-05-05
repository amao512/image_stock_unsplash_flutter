import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/config/resources/strings.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_provider.dart';
import 'package:image_stock_unsplash_flutter/core/utils/localization/app_localizations.dart';
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

class PhotoDetailsState extends State<PhotoDetailsPage> {
  PhotoDetailsCubit? cubit;

  @override
  void initState() {
    cubit = getIt<PhotoDetailsCubit>()..loadPhotoById(widget.photoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: BaseBlocProvider(
        bloc: cubit,
        builder: (context, state) {
          var result = state as PhotoDetailsBlocState;

          return Container(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    photoDetails(result, context),
                    const SizedBox(height: 32),
                    Text(
                      context.getString(Strings.similarPhotos),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    SimiliarPhotos(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget photoDetails(PhotoDetailsBlocState result, BuildContext context) {
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
        Text(
          context.getString(Strings.similarTags),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        PhotoTags(),
      ],
    );
  }
}
