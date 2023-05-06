import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/core/ui/modalBottomSheet/top_rounded_bottom_sheet_modal.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/photo_list_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/search/search_bottom_sheet.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PhotosCubit>(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.showFullHeightModalBottomSheet(
                  widget: const SearchBottomSheet(),
                );
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => context.push(Routes.favorites),
              icon: const Icon(Icons.favorite),
            ),
          ],
        ),
        body: const PhotosListWidget(),
      ),
    );
  }
}
