import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/widgets/profile_actions_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/widgets/similar_photos_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/widgets/tags_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/image_card_widget.dart';

class PhotoDetailsPage extends StatefulWidget {
  const PhotoDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => PhotoDetailsState();
}

class PhotoDetailsState extends State<PhotoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                photoDetails(),

                const SizedBox(height: 32),
                const Text(
                  "Похожие фотографии",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SimiliarPhotos(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget photoDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        const ProfileActions(
          profileImage: "https://s8.vcdn.biz/static/f/5864270381/image.jpg",
        ),
        const SizedBox(height: 24),
        ImageCard(
          imageUrl:
              "https://cdn.britannica.com/20/191120-050-B6C0B7E9/village-Hallstatt-Alps-Austria.jpg",
          onTap: () {},
        ),
        const SizedBox(height: 24),
        const Text(
          "Похожие теги",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        PhotoTags(),
      ],
    );
  }
}
