import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;
  const Failures(this.errMessage);

  @override
  String toString() => errMessage; // مهم عشان لما تعمل failure.toString()
}

class ServerFailures extends Failures {
  const ServerFailures(super.message);

  factory ServerFailures.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailures('Connection timeout. Please try again.');
      case DioExceptionType.sendTimeout:
        return const ServerFailures('Send timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        return const ServerFailures('Receive timeout. Please try again.');
      case DioExceptionType.badCertificate:
        return const ServerFailures('Bad SSL certificate.');
      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(
          e.response?.statusCode ?? 0,
          e.response?.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailures('Request was cancelled.');
      case DioExceptionType.connectionError:
        if (e.error is SocketException) {
          return const ServerFailures('No Internet Connection');
        }
        return const ServerFailures('Connection error. Please try again.');
      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return const ServerFailures('No Internet Connection');
        }
        return ServerFailures(e.message ?? 'Unknown error');
    }
  }

  factory ServerFailures.fromResponse(int status, dynamic data) {
    String fallback(int code) {
      if (code == 400) return 'Bad request.';
      if (code == 401) return 'Unauthorized.';
      if (code == 403) return 'Forbidden.';
      if (code == 404) return 'Your request was not found. Please try later.';
      if (code >= 500) return 'Internal server error. Please contact support.';
      return 'Something went wrong. Please try again later.';
    }

    try {
      if (data is Map) {
        final error = data['error'];
        if (error is Map && error['message'] is String) {
          return ServerFailures(error['message'] as String);
        }
        if (data['message'] is String) {
          return ServerFailures(data['message'] as String);
        }
      }
    } catch (_) {}

    return ServerFailures(fallback(status));
  }
}
