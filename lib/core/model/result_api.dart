import '../../data/models/failure.dart';

class ResultApi<T> {
  const ResultApi._();

  factory ResultApi.success(T value) = Success<T>;

  factory ResultApi.error(Failure failure) = Error<T>;
}

class Success<T> extends ResultApi<T> {
  const Success(this.value) : super._();

  final T value;
}

class Error<T> extends ResultApi<T> {
  const Error(this.failure) : super._();

  final Failure failure;
}