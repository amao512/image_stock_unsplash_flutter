import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_builder.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_state.dart';
import 'package:image_stock_unsplash_flutter/presentation/common/widgets/image_card_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/common/widgets/switch_list_view_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class PhotosListWidget extends StatefulWidget {
  const PhotosListWidget({super.key});

  @override
  State<StatefulWidget> createState() => PhotosListWidgetState();
}

class PhotosListWidgetState extends State<PhotosListWidget> {
  var isGridView = false;

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilder(
      bloc: context.read<PhotosCubit>()..loadPhotos(),
      builder: (context, state) {
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
      },
    );
  }

  Widget verticalListView(List<PhotoDvo> photos) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: photos.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ImageCard(
          imageUrl: photos[index].urls.regular,
          onTap: () {
            context.push(Routes.details, extra: photos[index].id);
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
              context.push(Routes.details, extra: photos[index].id);
            },
          );
        },
      ),
    );
  }
}
