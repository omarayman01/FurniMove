import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'start_move_state.dart';

class StartMoveCubit extends Cubit<StartMoveState> {
  StartMoveCubit(this.serviceProviderRepo) : super(StartMoveInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> startMove(UserModel user, int moveId) async {
    emit(StartMoveLoading());
    var result = await serviceProviderRepo.startMove(user, moveId);
    result.fold((faliure) {
      debugPrint('Failureee');
      emit(StartMoveFailure(errMessage: faliure.errMessage));
    }, (result) {
      emit(StartMoveSuccess(result: result));
    });
  }
}
