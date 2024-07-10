import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'update_truck_location_state.dart';

class UpdateTruckLocationCubit extends Cubit<UpdateTruckLocationState> {
  UpdateTruckLocationCubit(this.serviceProviderRepo)
      : super(UpdateTruckLocationInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> updateTruckLocation(
      UserModel user, Map<String, dynamic> data) async {
    emit(UpdateTruckLocationInitial());
    var result = await serviceProviderRepo.updateTruckLocation(user, data);
    result.fold(
        (faliure) =>
            emit(UpdateTruckLocationFailure(errMessage: faliure.errMessage)),
        (respond) {
      emit(UpdateTruckLocationSuccess(respond: respond));
    });
  }
}
