import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Faliure {
  final String errMessage;

  const Faliure(this.errMessage);
}

class ServerFailure extends Faliure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        {
          Fluttertoast.showToast(
            msg: 'Connection timeout with ApiServer',
            toastLength: Toast.LENGTH_LONG,
          );
          return ServerFailure("Connection timeout with ApiServer");
        }
      case DioExceptionType.sendTimeout:
        {
          Fluttertoast.showToast(
            msg: 'Send timeout with ApiServer',
            toastLength: Toast.LENGTH_LONG,
          );
          return ServerFailure("Send timeout with ApiServer");
        }
      case DioExceptionType.receiveTimeout:
        {
          Fluttertoast.showToast(
            msg: 'Receive timeout with ApiServer',
            toastLength: Toast.LENGTH_LONG,
          );
          return ServerFailure("Receive timeout with ApiServer");
        }

      case DioExceptionType.badCertificate:
        {
          Fluttertoast.showToast(
            msg: 'Bad Certificate',
            toastLength: Toast.LENGTH_LONG,
          );
          return ServerFailure("Bad Certificate");
        }
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        {
          Fluttertoast.showToast(
            msg: 'Request to ApiServer Cancelled',
            toastLength: Toast.LENGTH_LONG,
          );
          return ServerFailure("Request to ApiServer Cancelled");
        }
      case DioExceptionType.connectionError:
        {
          Fluttertoast.showToast(
            msg: 'Connection timeout!',
            toastLength: Toast.LENGTH_LONG,
          );
          return ServerFailure("Connection timeout!");
        }
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException') ||
            dioError.message!
                .contains("Failed host lookup: 'www.googleapis.com'")) {
          {
            Fluttertoast.showToast(
              msg: 'No Internet Connection',
              toastLength: Toast.LENGTH_LONG,
            );
            return ServerFailure("No Internet Connection");
          }
        }
        {
          Fluttertoast.showToast(
            msg: 'Unexpected error!!',
            toastLength: Toast.LENGTH_LONG,
          );
          return ServerFailure("Unexpected error!!");
        }
      default:
        {
          Fluttertoast.showToast(
            msg: 'Unexpected error!!, Try Again',
            toastLength: Toast.LENGTH_LONG,
          );
          return ServerFailure("Unexpected error!!, Try Again");
        }
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    debugPrint('INNNN Server');
    debugPrint(statusCode.toString());
    debugPrint(response.toString());

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      Fluttertoast.showToast(
        msg: response.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      debugPrint('mmmmmmmmmmmmmmmmm');

      debugPrint(response.toString());
      if (response != null) {
        Fluttertoast.showToast(
          msg: response.toString(),
          toastLength: Toast.LENGTH_LONG,
        );
      }
      return ServerFailure('Your Request Not Found!!');
    } else if (statusCode == 500) {
      Fluttertoast.showToast(
        msg: response.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
      return ServerFailure('Internal Server Error!!');
    } else {
      // Fluttertoast.showToast(
      //   msg: response.toString(),
      //   toastLength: Toast.LENGTH_LONG,
      // );
      return ServerFailure('Opps!! There was an error, Please try again');
    }
  }
}
