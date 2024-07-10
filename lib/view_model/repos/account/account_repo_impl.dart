import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
import 'package:furni_move/view_model/errors/failures.dart';
import 'package:furni_move/view_model/repos/account/account_repo.dart';

class AccountRepoImpl extends AccountRepo {
  @override
  Future<Either<Faliure, dynamic>> accountLogin(
      Map<String, dynamic> map) async {
    try {
      Response response =
          await DioHelper.postData(endPoint: EndPoints.login, data: map);
      debugPrint('login page!!!!');
      Map<String, dynamic> data = response.data;
      debugPrint(data.toString());
      user = UserModel.fromJson(data);
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_LONG,
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, dynamic>> accountRegister(
      Map<String, dynamic> map) async {
    try {
      Response response =
          await DioHelper.postData(endPoint: EndPoints.register, data: map);
      debugPrint('sign up page!!!!');
      Map<String, dynamic> data = response.data;
      debugPrint(data.toString());
      Fluttertoast.showToast(
        msg: "Account Created Successfuly",
        toastLength: Toast.LENGTH_LONG,
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, dynamic>> customerUpdateCredentials(
      UserModel user, Map<String, dynamic> credentials) async {
    try {
      Response response = await DioHelper.patchData(
          token: user.token, endPoint: EndPoints.updateUser, data: credentials);
      debugPrint('updateeeee page!!!!');
      Map<String, dynamic> data = response.data;
      debugPrint(data.toString());
      Fluttertoast.showToast(
        msg: "Credentials updated Successfully.",
        toastLength: Toast.LENGTH_LONG,
      );
      return right(data);
    } catch (e) {
      debugPrint('error eee ');
      if (e is DioException) {
        debugPrint(ServerFailure.fromDioError(e).toString());
        debugPrint('error before ');
        debugPrint(ServerFailure.fromDioError(e).toString());
        debugPrint('error after ');

        return left(ServerFailure.fromDioError(e));
      } else {
        debugPrint('error else ');
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
