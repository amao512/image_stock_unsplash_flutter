import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_builder.dart';
import 'package:image_stock_unsplash_flutter/presentation/common/widgets/image_card_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/search/bloc/search_photo_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/search/bloc/search_photo_state.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class SearchResults extends StatelessWidget {
  final String query;

  const SearchResults({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilder(
      bloc: context.read<SearchPhotoCubit>()..onSearch(query),
      builder: (context, state) {
        if (state is SearchPhotoState) {
          return buildResults(context, state);
        }

        return Container();
      },
    );
  }

  Widget buildResults(BuildContext context, SearchPhotoState result) {
    return Container(
      child: Expanded(
        child: GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          children: List.generate(
            result.photos.length,
                (index) {
              var photo = result.photos[index];

              return ImageCard(
                imageUrl: photo.urls.regular,
                onTap: () {
                  context.push(Routes.details, extra: photo.id);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
