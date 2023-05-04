import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/core/ui/base_state.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_state.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/image_card_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/switch_list_view_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class PhotosListWidget extends StatefulWidget {
  const PhotosListWidget({super.key});

  @override
  State<StatefulWidget> createState() => PhotosListWidgetState();
}

class PhotosListWidgetState extends BaseState<PhotosListWidget, PhotosCubit, PhotosState> {
  var isGridView = false;

  @override
  PhotosCubit createBloc(BuildContext context) {
    return getIt<PhotosCubit>()..loadPhotos();
  }

  @override
  Widget buildWidget(BuildContext context, PhotosState result) {
    if (result is PhotosLoadedState) {
      return Column(
        children: [
          SwitchListView(
            isGridView: isGridView,
            onSelect: (isGridView) {
              setState(() {
                this.isGridView = isGridView;
              });
            },
          ),
          Expanded(
              child: isGridView
                  ? gridListView(result.photos)
                  : verticalListView(result.photos))
        ],
      );
    } else {
      return Container();
    }
  }

  Widget verticalListView(List<PhotoDvo> photos) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(height: 18),
      itemCount: photos.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ImageCard(
          imageUrl: photos[index].urls.regular,
          onTap: () {
            context.push(Routes.details);
          },
        );
      },
    );
  }

  Widget gridListView(List<PhotoDvo> photos) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(
        photos.length,
        (index) {
          return ImageCard(
            imageUrl: photos[index].urls.regular,
            onTap: () {
              context.push(Routes.details);
            },
          );
        },
      ),
    );
  }
}
