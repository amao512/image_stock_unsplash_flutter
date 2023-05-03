import 'package:image_stock_unsplash_flutter/core/model/result_api.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

abstract class UseCase<Type> {

  launch<T>({
    required ResultApi<T> block,
    required Function(T) result,
    required Function(Failure) error,
  }) {
    if (block is Success<T>) {
      result(block.value);
    } else {
      error(block as Failure);
    }
  }
}

abstract class LaunchUseCase<Type> extends UseCase<Type> {

  void call(Function(Type) onResult, Function(Failure) onError);
}

abstract class LaunchUseCaseWithParam<Param, Type> extends UseCase<Type> {

  void call(Param param, Function(Type) result, Function(Failure) onError);
}
