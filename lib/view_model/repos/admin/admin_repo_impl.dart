import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
import 'package:furni_move/view_model/errors/failures.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  @override
  Future<Either<Faliure, List<RequestModel>>> fetchCompletedRequests(
      UserModel user) async {
    try {
      var response = await DioHelper.getData(
          endPoint: EndPoints.getCompletedRequests, token: user.token);
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      List<RequestModel> requests = [];
      dataList.forEach((item) {
        debugPrint('inloop');

        debugPrint(item.toString());
        requests.add(RequestModel.fromJson(item));
      });
      return right(requests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<RequestModel>>> fetchCreatedRequests(
      UserModel user) async {
    debugPrint('INNNNCreatedd');

    try {
      Response response = await DioHelper.getData(
          endPoint: EndPoints.getCreatedRequests, token: user.token);
      debugPrint('tryyyycreated');
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      List<RequestModel> requests = [];
      dataList.forEach((item) {
        debugPrint('inloop');

        debugPrint(item.toString());
        requests.add(RequestModel.fromJson(item));
      });
      return right(requests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<OfferModel>>> fetchOffersByRequestId(
      String id, UserModel user) async {
    try {
      var response = await DioHelper.getData(
          endPoint: '/api/Admin/getOffersByRequestId?moveRequestId=$id',
          token: user.token);
      List<OfferModel> offers = [];
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      dataList.forEach((item) {
        debugPrint('inloop');
        offers.add(OfferModel.fromJson(item));
      });
      print(offers);
      return right(offers);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<UserModel>>> fetchUsersbyRole(
      UserModel user, String role) async {
    try {
      var response = await DioHelper.getData(
          endPoint: '/api/Admin/getUsersByRole?role=$role', token: user.token);
      // debugPrint(data.toString());
      List<UserModel> users = [];
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      debugPrint('DataList: ${dataList.length}');
      print(dataList);
      for (var i = 0; i < dataList.length; i++) {
        debugPrint('inloop $i');
        debugPrint(dataList[i].toString());
        users.add(UserModel.fromJson(dataList[i]));
        debugPrint('done $i');
      }
      debugPrint(users.toString());
      debugPrint('rightttttttttuserss');
      return right(users);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<RequestModel>>> fetchAllRequests(
      UserModel user) async {
    try {
      Response response = await DioHelper.getData(
          endPoint: EndPoints.adminGetAllRequests, token: user.token);
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      List<RequestModel> requests = [];
      dataList.forEach((item) {
        debugPrint('inloop');

        debugPrint(item.toString());
        requests.add(RequestModel.fromJson(item));
      });
      return right(requests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<RequestModel>>> fetchOnGoingRequests(
      UserModel user) async {
    try {
      Response response = await DioHelper.getData(
          endPoint: EndPoints.getOnGoingRequests, token: user.token);
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      List<RequestModel> requests = [];
      dataList.forEach((item) {
        debugPrint('inloop');

        debugPrint(item.toString());
        requests.add(RequestModel.fromJson(item));
      });
      return right(requests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, dynamic>> suspendUser(
      String userId, UserModel user) async {
    try {
      Response response = await DioHelper.patchData(
          endPoint: '/api/Admin/suspendUser?userId=$userId', token: user.token);
      dynamic respond = response.data;
      return right(respond);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, dynamic>> unSuspendUser(
      String userId, UserModel user) async {
    try {
      Response response = await DioHelper.patchData(
          endPoint: '/api/Admin/unsuspendUser?userId=$userId',
          token: user.token);
      // debugPrint('tryyyycreated');
      dynamic respond = response.data;
      return right(respond);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<RequestModel>>> fetchWaitingRequests(
      UserModel user) async {
    try {
      Response response = await DioHelper.getData(
          endPoint: EndPoints.getWaitingRequests, token: user.token);
      // debugPrint('tryyyycreated');
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      List<RequestModel> requests = [];
      dataList.forEach((item) {
        debugPrint('inloop');

        debugPrint(item.toString());
        requests.add(RequestModel.fromJson(item));
      });
      return right(requests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
