import 'package:dio/dio.dart';

import 'api_exceptions.dart';

///[ExceptionInterceptor] class extends to [Interceptor] class from [Dio] package
///which helps to intercept between api calls and inject our codes and logic
class ExceptionInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(err.message);
    switch (err.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.badCertificate:
        throw BadRequestException(err.requestOptions);

      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions);

      default:
        break;
    }

    return super.onError(err, handler);
  }
}
