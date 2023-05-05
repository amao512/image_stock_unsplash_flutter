import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/config/resources/strings.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_provider.dart';
import 'package:image_stock_unsplash_flutter/core/utils/localization/app_localizations.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_state.dart';
import 'package:image_stock_unsplash_flutter/presentation/common/widgets/image_card_widget.dart';

import 'profile_actions_widget.dart';
import 'similar_photos_widget.dart';
import 'tags_widget.dart';

class PhotoDetails extends StatefulWidget {
  final String photoId;

  const PhotoDetails({required this.photoId, super.key});

  @override
  State<StatefulWidget> createState() => PhotoDetailsState();
}

class PhotoDetailsState extends State<PhotoDetails> {
  PhotoDetailsCubit? cubit;

  @override
  void initState() {
    cubit = getIt<PhotoDetailsCubit>()..loadPhotoById(widget.photoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider(
      bloc: cubit,
      builder: (context, state) {
        if (state is PhotoDetailsBlocState) {
          return Container(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    photoDetails(state, context),
                    const SizedBox(height: 32),
                    Text(
                      context.getString(Strings.similarPhotos),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    SimilarPhotos(photos: state.photo.relatedCollections),
                  ],
                ),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget photoDetails(PhotoDetailsBlocState result, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        ProfileActions(
          state: result,
          onFavourite: (isFavorite) {
            cubit?.onFavorite(result.photo, isFavorite);
          },
          onDownload: () {
            cubit?.downloadImage(result.photo.urls.regular);
          },
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
        PhotoTags(tags: result.photo.tags),
      ],
    );
  }
}