import 'package:image_stock_unsplash_flutter/core/model/result_api.dart';
import 'package:image_stock_unsplash_flutter/data/models/failure.dart';

abstract class UseCase {
  launch<T>({
    required Future<ResultApi<T>> Function() block,
    required Function(T) result,
    required Function(Failure) error,
  }) async {
    var value = await block();

    if (value is Success<T>) {
      result(value.value);
    } else {
      error((value as Error).failure);
    }
  }
}

abstract class LaunchUseCase<Type> extends UseCase {
  void call(Function(Type) onResult, {Function(Failure)? onError});
}

abstract class LaunchUseCaseWithParam<Param, Type> extends UseCase {
  void call(Param param, Function(Type) result, {Function(Failure)? onError});
}
