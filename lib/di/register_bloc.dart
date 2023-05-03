import 'package:image_stock_unsplash_flutter/di/init_locator.dart';
import 'package:image_stock_unsplash_flutter/presentation/pages/home/bloc/photos_cubit.dart';

registerBloc() {
  getIt.registerFactory(
    () => PhotosCubit(getIt()),
  );
}
