import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_state.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

abstract class BaseCubit<TBlocState extends BaseBlocState> extends BlocBase<TBlocState> {
  BaseCubit(super.state);

  void showError(Failure failure) {
    emit(ErrorBlocState(failure) as TBlocState);
  }
}