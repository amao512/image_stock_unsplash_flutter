import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/favorites/bloc/favorites_cubit.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_cubit.dart';

registerBloc() {
  getIt.registerFactory(
    () => PhotosCubit(getIt()),
  );

  getIt.registerFactory(
    () => PhotoDetailsCubit(getIt(), getIt(), getIt()),
  );

  getIt.registerFactory(() => FavoritesCubit(getIt()));
}
