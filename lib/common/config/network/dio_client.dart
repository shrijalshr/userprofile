import 'package:dio/dio.dart';

import 'api_endpoint.dart';
import 'app_interceptor.dart';
import 'loggin_interceptor.dart';

///[DioClient] class is a singleton class that implements the dio network fucntionalities.
///[init] method initializes the dio client instance by injecting the necessary Base Options for the Dio
///[get] methodd performs GET requests

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio _dio;

  DioClient._internal();

  void init() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiEndPoints.BASE_URL,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      contentType: 'application/json; charset=utf-8',
    );

    _dio = Dio(options)
      ..interceptors.add(
        Logging(),
      )
      ..interceptors.add(
        ExceptionInterceptors(),
      );
  }

  ///Get Method
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= <String, dynamic>{};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });

    var response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}
