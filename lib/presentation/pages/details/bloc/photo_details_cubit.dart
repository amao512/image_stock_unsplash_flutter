import 'package:image_stock_unsplash_flutter/core/bloc/base_cubit.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotoById/get_photo_by_id_usecase.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/details/bloc/photo_details_state.dart';

class PhotoDetailsCubit extends BaseCubit<PhotoDetailsBlocState> {
  GetPhotoByIdUseCase getPhotoByIdUseCase;

  PhotoDetailsCubit(this.getPhotoByIdUseCase);

  void loadPhotoById(String photoId) {
    getPhotoByIdUseCase(
      photoId,
      (result) => emitState(PhotoDetailsBlocState(result)),
      (error) => emitError(error),
    );
  }
}
