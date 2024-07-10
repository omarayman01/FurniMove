import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/truck.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'add_truck_state.dart';

class AddTruckCubit extends Cubit<AddTruckState> {
  AddTruckCubit(this.serviceProviderRepo) : super(AddTruckInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> addTruck(UserModel user, Map<String, String> data) async {
    emit(AddTruckInitial());
    var result = await serviceProviderRepo.addTruck(user, data);
    result.fold((faliure) {
      debugPrint('Failureee');
      emit(AddTruckFailure(errMessage: faliure.errMessage));
    }, (truck) {
      emit(AddTruckSuccess(truck: truck));
    });
  }
}
