import 'package:go_router/go_router.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/photo_details.dart';
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
            return const PhotoDetailsPage();
          },
        ),
      ],
    ),
  ],
);

String getPathFromRoute(String path) => path.replaceFirst("/", "");
