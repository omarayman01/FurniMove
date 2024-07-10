import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:furni_move/model/appliance.model.dart';
import 'package:furni_move/model/location.model.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/errors/failures.dart';

abstract class CustomerRepo {
  Future<Either<Faliure, LocationModel>> createLocation(
      UserModel user, Map<String, dynamic> data);
  Future<Either<Faliure, LocationModel>> createLocation2(
      UserModel user, Map<String, dynamic> data);

  Future<Either<Faliure, List<RequestModel>>> getHistory(UserModel user);

  Future<Either<Faliure, RequestModel>> customerGetCurrentMove(UserModel user);

  Future<Either<Faliure, dynamic>> customerCreateMoveRequest(
      UserModel user, Map<String, dynamic> data);

  Future<Either<Faliure, String>> customerGetAddress(
      UserModel user, int locationId);

  Future<Either<Faliure, List<OfferModel>>> customerGetOffers(UserModel user);

  Future<Either<Faliure, ApplianceModel>> customerAddAppliance(
      UserModel user, int moveId, FormData picData);

  Future<Either<Faliure, LocationModel>> customerGetTruckLocation(
      UserModel user, int truckId);

  Future<Either<Faliure, dynamic>> customerAcceptMoveOffer(
      UserModel user, int moveOfferId);

  Future<Either<Faliure, dynamic>> customerRateMove(
      UserModel user, int moveId, int rate);
}
