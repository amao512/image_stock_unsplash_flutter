import 'package:image_stock_unsplash_flutter/domain/usecase/downloadImage/download_image_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getFavoriteById/get_favorite_by_id_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getFavorites/get_favorites_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotoById/get_photo_by_id_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/removeFromFavorites/remove_from_favorites_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/saveToFavorites/save_to_favorites_usecase.dart';

import 'init_locator.dart';

registerUseCase() {
  getIt.registerFactory(
    () => GetPhotosUseCase(repository: getIt()),
  );

  getIt.registerFactory(
    () => GetPhotoByIdUseCase(getIt()),
  );

  getIt.registerFactory(() => DownloadImageUseCase());

  getIt.registerFactory(() => GetFavoritesUseCase(getIt()));

  getIt.registerFactory(() => SaveToFavoritesUseCase(getIt()));

  getIt.registerFactory(() => RemoveFromFavoritesUseCase(getIt()));

  getIt.registerFactory(() => GetFavoriteByIdUseCase(getIt()));
}
