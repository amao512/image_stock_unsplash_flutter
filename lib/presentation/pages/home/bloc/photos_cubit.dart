import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getPhotos/get_photos_usecase.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  final GetPhotosUseCase getPhotosUseCase;

  PhotosCubit(this.getPhotosUseCase) : super(PhotosLoadingState());

  void loadPhotos() {
    getPhotosUseCase.call(
      (result) => {
        emit(PhotosLoadedState(result))
      },
      (error) => {
        emit(PhotosErrorState())
      },
    );
  }
}
