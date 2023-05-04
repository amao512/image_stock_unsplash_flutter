import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

abstract class BaseBlocState {}

class LoadingBlocState extends BaseBlocState {}

class ErrorBlocState extends BaseBlocState {
  final Failure failure;

  ErrorBlocState(this.failure);
}