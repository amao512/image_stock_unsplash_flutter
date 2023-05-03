import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class PhotosListState extends State<PhotosList> {
  var isGridView = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        if (state is PhotosLoadingState) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PhotosErrorState) {
          return const Center(
            child: Text("Error"),
          );
        } else if (state is PhotosLoadedState) {
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
