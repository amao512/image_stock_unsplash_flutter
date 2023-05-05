import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/photo_list_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.push(Routes.favorites),
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: const PhotosListWidget(),
    );
  }
}
