import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/core/ui/base_bloc_builder.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_state.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/image_card_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/switch_list_view_widget.dart';

class PhotosList extends StatefulWidget {
  const PhotosList({super.key});

  @override
  State<StatefulWidget> createState() => PhotosListState();
}

class PhotosListState extends BaseState<PhotosList, PhotosCubit, PhotosState> {
  var isGridView = false;

  @override
  PhotosCubit createBloc(BuildContext context) {
    return getIt<PhotosCubit>()..loadPhotos();
  }

  @override
  Widget buildWidget(BuildContext context, PhotosState state) {
    if (state is PhotosLoadedState) {
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
                  ? gridListView(state.photos)
                  : verticalListView(state.photos))
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
          onTap: () {},
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
            onTap: () {},
          );
        },
      ),
    );
  }
}