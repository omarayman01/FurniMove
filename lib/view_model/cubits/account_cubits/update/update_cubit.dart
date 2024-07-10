import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/repos/account/account_repo.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit(this.accountRepo) : super(UpdateInitial());
  final AccountRepo accountRepo;
  Future<void> customerUpdate(UserModel user, Map<String, dynamic> data) async {
    emit(UpdateLoading());
    var result = await accountRepo.customerUpdateCredentials(user, data);
    result
        .fold((faliure) => emit(UpdateFailure(errMessage: faliure.errMessage)),
            (response) {
      debugPrint("Cubit");
      emit(UpdateSuccess(respose: response));
    });
  }
}
