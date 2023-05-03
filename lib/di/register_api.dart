import 'package:image_stock_unsplash_flutter/data/api/unsplash_api.dart';
import 'package:image_stock_unsplash_flutter/data/network/rest_client.dart';

import 'init_locator.dart';

registerApi() {
  getIt.registerSingleton(RestClient.createDioInstance());

  getIt.registerFactory(() => UnsplashApi(getIt()));
}