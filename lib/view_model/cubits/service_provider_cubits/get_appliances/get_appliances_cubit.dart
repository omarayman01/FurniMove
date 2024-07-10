import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/appliance.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'get_appliances_state.dart';

class GetAppliancesCubit extends Cubit<GetAppliancesState> {
  GetAppliancesCubit(this.serviceProviderRepo) : super(GetAppliancesInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> fetchGetAppliances(UserModel user, int moveId) async {
    emit(GetAppliancesLoading());
    var result = await serviceProviderRepo.fetchAppliancesByMove(user, moveId);
    result.fold((faliure) {
      debugPrint('Failure');
      emit(GetAppliancesFailure(errMessage: faliure.errMessage));
    }, (appliances) {
      debugPrint('Success');
      debugPrint(appliances.length.toString());
      emit(GetAppliancesSuccess(appliances: appliances));
    });
  }
}
