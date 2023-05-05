import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_stock_unsplash_flutter/config/build/build_config.dart';
import 'package:image_stock_unsplash_flutter/core/model/api_exception.dart';

class RestClient {
  static Dio? _instance;

  static Dio getInstance() {
    return _instance ?? createDioInstance();
  }

  static Dio createDioInstance() {
    var dio = Dio();

    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.queryParameters["client_id"] = BuildConfig.apiKey;

          if (kDebugMode) {
            print("Headers: ${options.headers}");
            print("Url: ${options.baseUrl}${options.path}");
            print("QueryParams: ${options.queryParameters}");
          }

          return handler.next(options);
        },
        onResponse: (response, handler) async {
          if (kDebugMode) {
            print('Status code: ${response.statusCode} - ${response.data}');
          }

          return handler.next(response);
        },
        onError: (DioError error, handler) async {
          return handleError(error, handler);
        },
      ),
    );

    return dio;
  }

  static handleError(DioError error, handler) {
    if (kDebugMode) {
      print('Error: ${error.message}\n${error.stackTrace}');
    }

    if (error.response == null) {
      return handler.next(ApiException(
        requestOptions: error.requestOptions,
        message: "Internal Server Error",
      ));
    }

    var statusCode = error.response?.statusCode;

    if (statusCode == 401) {
      refreshToken();

      return handler.next(ApiException(
        requestOptions: error.requestOptions,
        message: "Unauthorized Error",
      ));
    }

    return handler.next(ApiException(
      requestOptions: error.requestOptions,
      message: "Internal Server Error",
    ));
  }

  static refreshToken() async {
    // Response response;
    // Repository repository = Repository();
    // var dio = Dio();
    // final Uri apiUrl = Uri.parse(BASE_PATH + "auth/reIssueAccessToken");
    // var refreshToken = await repository.readData("refreshToken");
    // dio.options.headers["Authorization"] = "Bearer " + refreshToken;
    // try {
    //   response = await dio.postUri(apiUrl);
    //   if (response.statusCode == 200) {
    //     RefreshTokenResponse refreshTokenResponse =
    //     RefreshTokenResponse.fromJson(jsonDecode(response.toString()));
    //     repository.addValue('accessToken', refreshTokenResponse.data.accessToken);
    //     repository.addValue('refreshToken', refreshTokenResponse.data.refreshToken);
    //   } else {
    //     print(response.toString());
    //   }
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
