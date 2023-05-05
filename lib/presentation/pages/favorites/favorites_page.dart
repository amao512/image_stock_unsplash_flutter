import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/config/resources/strings.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_provider.dart';
import 'package:image_stock_unsplash_flutter/core/utils/localization/app_localizations.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/presentation/common/widgets/image_card_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/common/widgets/switch_list_view_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/favorites/bloc/favorites_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/favorites/bloc/favorites_state.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  var isGridView = false;
  FavoritesCubit? cubit;

  @override
  void initState() {
    cubit = getIt<FavoritesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString(Strings.favorites)),
      ),
      body: BaseBlocProvider(
        bloc: cubit,
        builder: (context, state) {
          if (state is FavoritesBlocState) {
            Column(
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
                        ? gridListView(state.favorites)
                        : verticalListView(state.favorites))
              ],
            );
          }

          return Container();
        },
      ),
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
