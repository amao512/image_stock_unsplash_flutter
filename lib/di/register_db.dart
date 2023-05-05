import 'package:image_stock_unsplash_flutter/data/db/favorites_db.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';

registerDb() {
  getIt.registerFactory(() => FavoritesPhotoDatabase.instance);
}