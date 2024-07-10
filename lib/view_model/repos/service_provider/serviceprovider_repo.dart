import 'package:dartz/dartz.dart';
import 'package:furni_move/model/appliance.model.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/truck.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/errors/failures.dart';

abstract class ServiceProviderRepo {
  Future<Either<Faliure, TruckModel>> addTruck(
      UserModel user, Map<String, dynamic> data);

  Future<Either<Faliure, TruckModel>> getTruck(UserModel user);

  Future<Either<Faliure, TruckModel>> updateTruck(
      UserModel user, Map<String, dynamic> data);

  Future<Either<Faliure, dynamic>> updateTruckLocation(
      UserModel user, Map<String, dynamic> data);

  Future<Either<Faliure, List<RequestModel>>> fetchCreatedMoveRequests(
      UserModel user);

  Future<Either<Faliure, List<RequestModel>>> fetchMovesHistoryRequests(
      UserModel user);
  Future<Either<Faliure, List<OfferModel>>> fetchAllOffers(UserModel user);

  Future<Either<Faliure, RequestModel>> fetchCurrentMoveRequest(UserModel user);
  Future<Either<Faliure, List<ApplianceModel>>> fetchAppliancesByMove(
      UserModel user, int moveId);

  Future<Either<Faliure, dynamic>> createOffer(
      UserModel user, Map<String, dynamic> data);

  Future<Either<Faliure, dynamic>> startMove(UserModel user, int moveID);
  Future<Either<Faliure, dynamic>> endMove(UserModel user, int moveID);
}
