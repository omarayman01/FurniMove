import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/truck.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'update_truck_state.dart';

class UpdateTruckCubit extends Cubit<UpdateTruckState> {
  UpdateTruckCubit(this.serviceProviderRepo) : super(UpdateTruckInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> updateTruck(UserModel user, Map<String, String> data) async {
    emit(UpdateTruckInitial());
    var result = await serviceProviderRepo.updateTruck(user, data);
    result.fold(
        (faliure) => emit(UpdateTruckFailure(errMessage: faliure.errMessage)),
        (truck) {
      emit(UpdateTruckSuccess(truck: truck));
    });
  }
}
