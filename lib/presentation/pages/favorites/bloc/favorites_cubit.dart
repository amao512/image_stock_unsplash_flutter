import 'package:image_stock_unsplash_flutter/core/bloc/base_cubit.dart';
import 'package:image_stock_unsplash_flutter/domain/usecase/getFavorites/get_favorites_usecase.dart';

import 'favorites_state.dart';

class FavoritesCubit extends BaseCubit<FavoritesBlocState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesCubit(this.getFavoritesUseCase);

  void loadFavorites() {
    getFavoritesUseCase(
      (result) {
        emitState(FavoritesBlocState(result));
      },
      onError: (error) => emitError(error),
    );
  }
}
