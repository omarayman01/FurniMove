import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'end_move_state.dart';

class EndMoveCubit extends Cubit<EndMoveState> {
  EndMoveCubit(this.serviceProviderRepo) : super(EndMoveInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> endMove(UserModel user, int moveId) async {
    emit(EndMoveLoading());
    var result = await serviceProviderRepo.endMove(user, moveId);
    result.fold((faliure) {
      debugPrint('Failureee');
      emit(EndMoveFailure(errMessage: faliure.errMessage));
    }, (result) {
      emit(EndMoveSuccess(result: result));
    });
  }
}
