// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/model/appliance.model.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/truck.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
import 'package:furni_move/view_model/errors/failures.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

class ServiceProviderRepoImpl implements ServiceProviderRepo {
  @override
  Future<Either<Faliure, TruckModel>> addTruck(
      UserModel user, Map<String, dynamic> data) async {
    try {
      var response = await DioHelper.postData(
          endPoint: EndPoints.addTruck, token: user.token, data: data);
      TruckModel truck;
      truck = TruckModel.fromJson(response.data);
      debugPrint('Truckkk');
      debugPrint(truck.plateNumber.toString());
      return right(truck);
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

  @override
  Future<Either<Faliure, List<RequestModel>>> fetchCreatedMoveRequests(
      UserModel user) async {
    try {
      var response = await DioHelper.getData(
          endPoint: EndPoints.getCreatedMoveRequests, token: user.token);
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
  Future<Either<Faliure, List<RequestModel>>> fetchMovesHistoryRequests(
      UserModel user) async {
    try {
      var response = await DioHelper.getData(
          endPoint: EndPoints.getAllMovesBySeriviceProvider, token: user.token);
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      List<RequestModel> requests = [];
      dataList.forEach((item) {
        debugPrint('inloop');
        debugPrint(item.toString());
        requests.add(RequestModel.fromJson(item));
      });
      debugPrint('return');

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
  Future<Either<Faliure, RequestModel>> fetchCurrentMoveRequest(
      UserModel user) async {
    try {
      var response = await DioHelper.getData(
        endPoint: EndPoints.currentMove,
        token: user.token,
      );
      RequestModel request;
      request = RequestModel.fromJson(response.data);
      debugPrint('CurrentMove');
      return right(request);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, dynamic>> createOffer(
      UserModel user, Map<String, dynamic> data) async {
    try {
      var response = await DioHelper.postData(
          endPoint: EndPoints.createOffer, token: user.token, data: data);
      dynamic respond;
      respond = response.data;
      debugPrint(respond.toString());
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
  Future<Either<Faliure, dynamic>> updateTruckLocation(
      UserModel user, Map<String, dynamic> data) async {
    try {
      var response = await DioHelper.postData(
          endPoint: EndPoints.updateTruckLocation,
          token: user.token,
          data: data);
      dynamic respond;
      respond = response.data;
      debugPrint(respond.toString());
      return right(respond);
    } catch (e) {
      debugPrint('error eee ');
      if (e is DioException) {
        debugPrint('error failure ');
        debugPrint(e.toString());
        return left(ServerFailure.fromDioError(e));
      } else {
        debugPrint('error failure else');
        debugPrint(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, TruckModel>> updateTruck(
      UserModel user, Map<String, dynamic> data) async {
    try {
      var response = await DioHelper.patchData(
          endPoint: EndPoints.updateTruck, token: user.token, data: data);
      TruckModel truck;
      truck = TruckModel.fromJson(response.data);
      debugPrint('Truckkk');
      debugPrint(truck.plateNumber.toString());
      return right(truck);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, TruckModel>> getTruck(UserModel user) async {
    try {
      var response = await DioHelper.getData(
        endPoint: EndPoints.getTruck,
        token: user.token,
      );
      TruckModel truck;
      truck = TruckModel.fromJson(response.data);
      debugPrint('Truckkk');
      debugPrint(truck.plateNumber.toString());
      return right(truck);
    } catch (e) {
      debugPrint('error eee ');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, List<ApplianceModel>>> fetchAppliancesByMove(
      UserModel user, int moveId) async {
    try {
      var response = await DioHelper.getData(
          endPoint: '/api/ServiceProvider/GetAppliancesByMove?moveId=$moveId',
          token: user.token);
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      List<ApplianceModel> appliances = [];
      dataList.forEach((item) {
        debugPrint('inloop');
        debugPrint(item.toString());
        appliances.add(ApplianceModel.fromJson(item));
        debugPrint('ADDED');
      });
      debugPrint('AAAAAAAAAAAA');

      return right(appliances);
    } catch (e) {
      if (e is DioException) {
        debugPrint('eeeeeeeeeeeeeeee');

        return left(ServerFailure.fromDioError(e));
      } else {
        debugPrint('CCCCCCCCCCCCCCCCCC');

        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliure, dynamic>> startMove(UserModel user, int moveID) async {
    try {
      var response = await DioHelper.putData(
        endPoint: '/api/ServiceProvider/StartMove?moveId=$moveID',
        token: user.token,
      );
      dynamic respond;
      respond = response.data;
      debugPrint(respond.toString());
      Fluttertoast.showToast(
        msg: "Move Started",
        toastLength: Toast.LENGTH_LONG,
      );
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
  Future<Either<Faliure, dynamic>> endMove(UserModel user, int moveID) async {
    try {
      var response = await DioHelper.putData(
        endPoint: '/api/ServiceProvider/EndMove?moveId=$moveID',
        token: user.token,
      );
      dynamic respond;
      respond = response.data;
      debugPrint(respond.toString());
      Fluttertoast.showToast(
        msg: "Move Ended",
        toastLength: Toast.LENGTH_LONG,
      );
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
  Future<Either<Faliure, List<OfferModel>>> fetchAllOffers(
      UserModel user) async {
    try {
      var response = await DioHelper.getData(
          endPoint: EndPoints.getAllMoveOffersByServiceProvider,
          token: user.token);
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      List<OfferModel> offers = [];
      dataList.forEach((item) {
        debugPrint('inloop');
        debugPrint(item.toString());
        offers.add(OfferModel.fromJson(item));
      });
      debugPrint('return');

      return right(offers);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
