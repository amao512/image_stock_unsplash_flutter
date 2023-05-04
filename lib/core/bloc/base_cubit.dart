import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_state.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

abstract class BaseCubit<TBlocState> extends BlocBase<BaseBlocState> {
  BaseCubit() : super(BaseBlocState.loading()) {
    initState();
  }

  void initState() {}

  void emitState(TBlocState state) {
    emit(BaseBlocState.result(state));
  }

  void emitError(Failure failure) {
    emit(BaseBlocState.error(failure));
  }
}
