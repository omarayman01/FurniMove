import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/truck.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'get_truck_state.dart';

class GetTruckCubit extends Cubit<GetTruckState> {
  GetTruckCubit(this.serviceProviderRepo) : super(GetTruckInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> getTruck(UserModel user) async {
    emit(GetTruckInitial());
    var result = await serviceProviderRepo.getTruck(user);
    result.fold((faliure) {
      emit(GetTruckFailure(errMessage: faliure.errMessage));
    }, (truck) {
      emit(GetTruckSuccess(truck: truck));
    });
  }
}
