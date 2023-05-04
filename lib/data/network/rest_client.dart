import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_stock_unsplash_flutter/config/build/build_config.dart';

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
            print('Response: ${response.statusCode} - ${response.data}');
          }

          return handler.next(response);
        },
        onError: (DioError error, handler) async {
          if (kDebugMode) {
            print('Error: ${error.message}\n${error.stackTrace}');
          }

          if (error.response != null) {
            if (error.response?.statusCode == 401) {
              print("=== 401 Error ================================");
              //   dio.interceptors.requestLock.lock();
              //   dio.interceptors.responseLock.lock();
              //   RequestOptions requestOptions = e.requestOptions;
              //
              //   await refreshToken();
              //   Repository repository = Repository();
              //   var accessToken = await repository.readData("accessToken");
              //   final opts = new Options(method: requestOptions.method);
              //   dio.options.headers["Authorization"] = "Bearer " + accessToken;
              //   dio.options.headers["Accept"] = "*/*";
              //   dio.interceptors.requestLock.unlock();
              //   dio.interceptors.responseLock.unlock();
              //   final response = await dio.request(requestOptions.path,
              //       options: opts,
              //       cancelToken: requestOptions.cancelToken,
              //       onReceiveProgress: requestOptions.onReceiveProgress,
              //       data: requestOptions.data,
              //       queryParameters: requestOptions.queryParameters);
              //   if (response != null) {
              //     handler.resolve(response);
              //   } else {
              //     return null;
              //   }
              // } else {
              //   handler.next(e);
              // }
            }
          }

          return handler.next(error);
        },
      ),
    );

    return dio;
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
    //     print(response.toString()); //TODO: logout
    //   }
    // } catch (e) {
    //   print(e.toString()); //TODO: logout
    // }
  }
}
