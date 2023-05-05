import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository.dart';
import 'package:image_stock_unsplash_flutter/data/repository/unsplash_repository_impl.dart';
import 'package:image_stock_unsplash_flutter/di/init_locator.dart';

registerRepository() {
  getIt.registerFactory<UnsplashRepository>(
    () => UnsplashRepositoryImpl(api: getIt(), dataSource: getIt()),
  );
}
