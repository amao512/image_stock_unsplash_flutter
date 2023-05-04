import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotoById/get_photo_by_id_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_usecase.dart';

import 'init_locator.dart';

registerUseCase() {
  getIt.registerFactory(
    () => GetPhotosUseCase(repository: getIt()),
  );

  getIt.registerFactory(
    () => GetPhotoByIdUseCase(getIt()),
  );
}
