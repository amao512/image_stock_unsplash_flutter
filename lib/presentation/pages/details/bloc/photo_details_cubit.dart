import 'package:image_stock_unsplash_flutter/core/bloc/base_cubit.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/downloadImage/download_image_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotoById/get_photo_by_id_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/saveToFavorites/save_to_favorites_usecase.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_state.dart';

class PhotoDetailsCubit extends BaseCubit<PhotoDetailsBlocState> {
  GetPhotoByIdUseCase getPhotoByIdUseCase;
  DownloadImageUseCase downloadImageUseCase;
  SaveToFavoritesUseCase saveToFavoritesUseCase;

  PhotoDetailsCubit(
    this.getPhotoByIdUseCase,
    this.downloadImageUseCase,
    this.saveToFavoritesUseCase,
  );

  void loadPhotoById(String photoId) {
    getPhotoByIdUseCase(
      photoId,
      (result) => emitState(PhotoDetailsBlocState(result)),
      onError: (error) => emitError(error),
    );
  }

  void saveToFavorite(PhotoDvo photo) {
    saveToFavoritesUseCase(photo, (result) {});
  }

  void downloadImage(String imageUrl) {
    downloadImageUseCase(imageUrl, (result) {});
  }
}
