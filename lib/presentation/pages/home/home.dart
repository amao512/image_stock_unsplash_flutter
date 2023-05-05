import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/photo_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: const PhotosListWidget(),
    );
  }
}
