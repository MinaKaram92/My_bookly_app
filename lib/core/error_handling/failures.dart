import 'dart:async';
import 'dart:io';

import 'package:bookly_app/core/error_handling/exceptions.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromErrorType(e) {
    if (e is SocketException) {
      return ServerFailure(
          'No internet Connection, check your connection and try again');
    } else if (e is TimeoutException) {
      return ServerFailure('Request timeout, please try again later');
    } else if (e is BadRequestException) {
      return ServerFailure('Bad request');
    } else if (e is UnauthorisedException) {
      return ServerFailure('Unauthorised');
    } else if (e is FetchDataException) {
      return ServerFailure('Unexpected Error, Please try again');
    }
    return ServerFailure('Oops there was an error, please try agian later');
  }
}
