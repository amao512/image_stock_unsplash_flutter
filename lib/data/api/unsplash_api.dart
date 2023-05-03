import 'package:dio/dio.dart';
import 'package:image_stock_unsplash_flutter/config/build/build_config.dart';
import 'package:retrofit/http.dart';

import '../models/photo_entity.dart';

part 'unsplash_api.g.dart';

@RestApi(baseUrl: BuildConfig.apiUrl)
abstract class UnsplashApi {
  factory UnsplashApi(Dio dio, {String baseUrl}) = _UnsplashApi;

  @GET("/photos")
  Future<List<PhotoEntity>> getPhotos();
}