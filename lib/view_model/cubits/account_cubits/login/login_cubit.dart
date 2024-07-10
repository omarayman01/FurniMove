import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/view_model/repos/account/account_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.accountRepo) : super(LoginInitial());
  final AccountRepo accountRepo;
  Future<void> customerLogin(Map<String, dynamic> data) async {
    emit(LoginLoading());
    var result = await accountRepo.accountLogin(data);
    result.fold((faliure) => emit(LoginFailure(errMessage: faliure.errMessage)),
        (response) {
      debugPrint("Cubit");
      emit(LoginSuccess(response: response));
    });
  }
}
