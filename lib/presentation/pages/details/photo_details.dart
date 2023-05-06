import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/widgets/photo_details_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class PhotoDetailsPage extends StatelessWidget {
  final String photoId;

  const PhotoDetailsPage({required this.photoId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PhotoDetailsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => context.push(Routes.favorites),
              icon: const Icon(Icons.favorite),
            ),
          ],
        ),
        body: PhotoDetails(photoId: photoId),
      ),
    );
  }
}
