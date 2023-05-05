import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/core/utils/extensions/string_ext.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/photo_details.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/favorites/favorites_page.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/home.dart';
import 'package:image_stock_unsplash_flutter/presentation/router/routes.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: getPathFromRoute(Routes.details),
          builder: (context, state) {
            String photoId = state.extra as String;

            return PhotoDetailsPage(photoId: photoId.orEmpty());
          },
        ),
        GoRoute(
          path: getPathFromRoute(Routes.favorites),
          builder: (context, state) {
            return const FavoritesPage();
          }
        ),
      ],
    ),
  ],
);

String getPathFromRoute(String path) => path.replaceFirst("/", "");
