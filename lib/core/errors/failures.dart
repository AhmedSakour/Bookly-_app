import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api Server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Api Server');

      case DioExceptionType.badCertificate:
        return ServerFailure(
            'Certificate for Api Server is invalid or not trusted');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to Api Server was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with Api Server');

      case DioExceptionType.unknown:
        return ServerFailure(
            'An unknown error occurred while communicating with Api Server');

      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, var response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request not Found , please try Later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error , please try later');
    } else {
      return ServerFailure('Opps there was an error , please try again');
    }
  }
}
