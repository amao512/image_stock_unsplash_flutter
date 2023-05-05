import 'package:get_it/get_it.dart';
import 'package:image_stock_unsplash_flutter/di/register_api.dart';
import 'package:image_stock_unsplash_flutter/di/register_bloc.dart';
import 'package:image_stock_unsplash_flutter/di/register_db.dart';
import 'package:image_stock_unsplash_flutter/di/register_repository.dart';
import 'package:image_stock_unsplash_flutter/di/register_usecase.dart';

final getIt = GetIt.instance;

initLocator() {
  registerApi();
  registerDb();
  registerRepository();
  registerUseCase();
  registerBloc();
}