import 'package:dartz/dartz.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/errors/failures.dart';

abstract class AccountRepo {
  Future<Either<Faliure, dynamic>> accountLogin(Map<String, dynamic> map);

  Future<Either<Faliure, dynamic>> accountRegister(Map<String, dynamic> map);
  Future<Either<Faliure, dynamic>> customerUpdateCredentials(
      UserModel user, Map<String, dynamic> data);
}
