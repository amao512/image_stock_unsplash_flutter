import 'package:image_stock_unsplash_flutter/core/bloc/base_cubit.dart';
import 'package:image_stock_unsplash_flutter/domain/model/photo_dvo.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/downloadImage/download_image_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getFavoriteById/get_favorite_by_id_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotoById/get_photo_by_id_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/removeFromFavorites/remove_from_favorites_usecase.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/saveToFavorites/save_to_favorites_usecase.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_state.dart';

class PhotoDetailsCubit extends BaseCubit<PhotoDetailsBlocState> {
  GetPhotoByIdUseCase getPhotoByIdUseCase;
  DownloadImageUseCase downloadImageUseCase;
  SaveToFavoritesUseCase saveToFavoritesUseCase;
  GetFavoriteByIdUseCase getFavoriteByIdUseCase;
  RemoveFromFavoritesUseCase removeFromFavoritesUseCase;

  PhotoDetailsCubit(
    this.getPhotoByIdUseCase,
    this.downloadImageUseCase,
    this.saveToFavoritesUseCase,
    this.getFavoriteByIdUseCase,
    this.removeFromFavoritesUseCase,
  );

  void loadPhotoById(String photoId) {
    getPhotoByIdUseCase(
      photoId,
      (photo) {
        getFavoriteByIdUseCase(photoId, (favorite) {
          emitState(PhotoDetailsBlocState(photo, favorite != null));
        }, onError: (error) {
          emitState(PhotoDetailsBlocState(photo, false));
        });
      },
      onError: (error) => emitError(error),
    );
  }

  void onFavorite(PhotoDvo photo, bool isFavorite) {
    if (isFavorite) {
      removeFromFavoritesUseCase(photo.id, (result) {

      });
    } else {
      saveToFavoritesUseCase(photo, (result) {

      });
    }
  }

  void downloadImage(String imageUrl) {
    downloadImageUseCase(imageUrl, (result) {});
  }
}
