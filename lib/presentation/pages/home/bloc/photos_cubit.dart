import 'package:image_stock_unsplash_flutter/core/bloc/base_cubit.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_usecase.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_state.dart';

class PhotosCubit extends BaseCubit<PhotosState> {
  final GetPhotosUseCase getPhotosUseCase;

  PhotosCubit(this.getPhotosUseCase) : super(PhotosLoadingState());

  void loadPhotos() {
    getPhotosUseCase(
      (result) {
        emit(PhotosLoadedState(result));
      },
      (error) {
        showError(error);
      },
    );
  }
}
