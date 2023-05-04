import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

class BaseBlocState<T> {

  const BaseBlocState._();

  factory BaseBlocState.loading() = LoadingBlocState<T>;

  factory BaseBlocState.result(T value) = ResultBlocState<T>;

  factory BaseBlocState.error(Failure failure) = ErrorBlocState<T>;
}

class LoadingBlocState<T> extends BaseBlocState<T> {
  const LoadingBlocState() : super._();
}

class ResultBlocState<T> extends BaseBlocState<T> {
  const ResultBlocState(this.state) : super._();

  final T state;
}

class ErrorBlocState<T> extends BaseBlocState<T> {
  const ErrorBlocState(this.failure) : super._();

  final Failure failure;
}