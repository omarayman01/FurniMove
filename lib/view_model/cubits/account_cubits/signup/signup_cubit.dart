import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/view_model/repos/account/account_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.accountRepo) : super(SignupInitial());
  final AccountRepo accountRepo;
  Future<void> customerSignup(Map<String, dynamic> data) async {
    emit(SignupLoading());
    var result = await accountRepo.accountRegister(data);
    result
        .fold((faliure) => emit(SignupFailure(errMessage: faliure.errMessage)),
            (response) {
      debugPrint("Cubit");
      emit(SignupSuccess(response: response));
    });
  }
}
