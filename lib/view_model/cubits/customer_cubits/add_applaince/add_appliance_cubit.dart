import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/appliance.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'add_appliance_state.dart';

class AddApplianceCubit extends Cubit<AddApplianceState> {
  AddApplianceCubit(this.customerRepo) : super(AddApplianceInitial());
  final CustomerRepo customerRepo;
  Future<void> customerAddAppliance(
      UserModel user, int moveId, FormData picData) async {
    emit(AddApplianceLoading());
    var result = await customerRepo.customerAddAppliance(user, moveId, picData);
    result.fold(
        (faliure) => emit(AddApplianceFailure(errMessage: faliure.errMessage)),
        (appliance) {
      emit(AddApplianceSuccess(appliance: appliance));
    });
  }
}
