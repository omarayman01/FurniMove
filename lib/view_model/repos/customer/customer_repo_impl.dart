import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/model/appliance.model.dart';
import 'package:furni_move/model/location.model.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
import 'package:furni_move/view_model/errors/failures.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

class CustomerRepoImpl extends CustomerRepo {
  @override
  Future<Either<Faliure, LocationModel>> createLocation(
      UserModel user, Map<String, dynamic> data) async {
    try {
      dynamic response = await DioHelper.postData(
          endPoint: EndPoints.customerCreateLocation,
          token: user.token,
          data: data);
      dynamic id = response.data['id'];
      dynamic longitude = response.data['longitude'];
      dynamic latitude = response.data['latitude'];
      debugPrint(id.toString());
      debugPrint(longitude.toString());
      debugPrint(latitude.toString());
      LocationModel(id: id, longitude: longitude, latitude: latitude);
      return right(
          LocationModel(id: id, longitude: longitude, latitude: latitude));
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
  Future<Either<Faliure, List<RequestModel>>> getHistory(UserModel user) async {
    try {
      var response = await DioHelper.getData(
          endPoint: EndPoints.customerGetHistory, token: user.token);
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
  Future<Either<Faliure, RequestModel>> customerGetCurrentMove(
      UserModel user) async {
    try {
      var response = await DioHelper.getData(
        endPoint: EndPoints.customerGetCurrentMove,
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
  Future<Either<Faliure, dynamic>> customerCreateMoveRequest(
      UserModel user, Map<String, dynamic> data) async {
    try {
      var response = await DioHelper.postData(
          endPoint: EndPoints.customerCreateMoveRequest,
          token: user.token,
          data: data);
      dynamic respond;
      respond = response.data;
      debugPrint(respond['id'].toString());
      debugPrint(respond.toString());

      // Fluttertoast.showToast(
      //   msg: respond.toString(),
      //   toastLength: Toast.LENGTH_LONG,
      // );
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
  Future<Either<Faliure, String>> customerGetAddress(
      UserModel user, int locationId) async {
    try {
      var response = await DioHelper.getData(
        endPoint: '/api/Customer/GetAddress?locationId=$locationId',
        token: user.token,
      );
      String respond;
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
  Future<Either<Faliure, List<OfferModel>>> customerGetOffers(
      UserModel user) async {
    try {
      var response = await DioHelper.getData(
          endPoint: EndPoints.customerGetOffers, token: user.token);
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

  @override
  Future<Either<Faliure, ApplianceModel>> customerAddAppliance(
      UserModel user, int moveId, FormData picData) async {
    try {
      ApplianceModel appliance;
      Response response = await DioHelper.postData(
        token: user.token,
        endPoint: '/api/Customer/AddAppliance?moveId=$moveId',
        imgData: picData,
      );
      appliance = ApplianceModel.fromJson(response.data);
      debugPrint(response.data.toString());
      Fluttertoast.showToast(
        msg: "Appliance Added",
        toastLength: Toast.LENGTH_LONG,
      );
      return right(appliance);
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
  Future<Either<Faliure, LocationModel>> customerGetTruckLocation(
      UserModel user, int truckId) async {
    try {
      var response = await DioHelper.getData(
        endPoint: '/api/Customer/GetTruckLocation?Id=$truckId',
        token: user.token,
      );
      // LocationModel location;
      // location = LocationModel.fromJson(response.data);
      // debugPrint('locationkk');
      // debugPrint(location.id.toString());
      dynamic id = response.data['id'];
      dynamic longitude = response.data['longitude'];
      dynamic latitude = response.data['latitude'];
      LocationModel(id: id, longitude: longitude, latitude: latitude);
      Fluttertoast.showToast(
        msg: "Location Fetched",
        toastLength: Toast.LENGTH_LONG,
      );
      return right(
          LocationModel(id: id, longitude: longitude, latitude: latitude));
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
  Future<Either<Faliure, dynamic>> customerAcceptMoveOffer(
      UserModel user, int moveOfferId) async {
    try {
      var response = await DioHelper.putData(
        endPoint: '/api/Customer/AcceptMoveOffer?Id=$moveOfferId',
        token: user.token,
      );
      dynamic respond;
      respond = response.data;
      debugPrint(respond.toString());
      Fluttertoast.showToast(
        msg: respond.toString(),
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
  Future<Either<Faliure, LocationModel>> createLocation2(
      UserModel user, Map<String, dynamic> data) async {
    try {
      dynamic response = await DioHelper.postData(
          endPoint: EndPoints.customerCreateLocation,
          token: user.token,
          data: data);
      dynamic id = response.data['id'];
      dynamic longitude = response.data['longitude'];
      dynamic latitude = response.data['latitude'];
      debugPrint(id.toString());
      debugPrint(longitude.toString());
      debugPrint(latitude.toString());
      LocationModel(id: id, longitude: longitude, latitude: latitude);
      return right(
          LocationModel(id: id, longitude: longitude, latitude: latitude));
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

  ///api/Customer/RateMove?MoveId=1&Rate=1
  @override
  Future<Either<Faliure, dynamic>> customerRateMove(
      UserModel user, int moveId, int rate) async {
    try {
      dynamic response = await DioHelper.putData(
        endPoint: '/api/Customer/RateMove?MoveId=$moveId&Rate=$rate',
        token: user.token,
      );

      debugPrint(response.data);
      Fluttertoast.showToast(
        msg: 'Rate submitted.',
        toastLength: Toast.LENGTH_LONG,
      );
      return right(response);
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
