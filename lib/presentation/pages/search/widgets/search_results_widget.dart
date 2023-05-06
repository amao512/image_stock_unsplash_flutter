import 'package:flutter/cupertino.dart';

class SearchResults extends StatelessWidget {
  final String query;

  const SearchResults({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: GridView.count(
      //   padding: const EdgeInsets.all(16),
      //   mainAxisSpacing: 8,
      //   crossAxisSpacing: 8,
      //   crossAxisCount: 2,
      //   children: List.generate(
      //     photos.length,
      //         (index) {
      //       return ImageCard(
      //         imageUrl: photos[index].urls.regular,
      //         onTap: () {
      //           context.push(Routes.details, extra: photos[index].id);
      //         },
      //       );
      //     },
      //   ),
      // ),
    );
  }
}