import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/widgets/image_card_widget.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

class SimiliarPhotos extends StatelessWidget {
  List<String> photos = [
    "https://s1.it.atcdn.net/wp-content/uploads/2019/09/IT_LandingPage_HeaderImage_Austria_2019_Sept.jpg",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/4d/44/3c/austria.jpg?w=700&h=500&s=1",
    "https://www.costsavertour.com/media/mjmnp2uo/austria-innsbruck-mountains-1192515427-ge-na-2309x1299.jpg?center=0.5%2C0.5&format=webp&mode=crop&width=1200&height=600&quality=80",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDmUz7jqlRoiIhnvOLheXpg6Xtr1VjtQKYOw&usqp=CAU"
  ];

  SimiliarPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: photos.map((photo) {
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: ImageCard(
          imageUrl: photo,
          onTap: () {
            context.push(Routes.details);
          },
        ),
      );
    }).toList());
  }
}
