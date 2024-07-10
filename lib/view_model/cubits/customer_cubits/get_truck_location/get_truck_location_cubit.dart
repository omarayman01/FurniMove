import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/location.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'get_truck_location_state.dart';

class GetTruckLocationCubit extends Cubit<GetTruckLocationState> {
  GetTruckLocationCubit(this.customerRepo) : super(GetTruckLocationInitial());
  final CustomerRepo customerRepo;
  Future<void> fetchTruckLocation(UserModel user, int truckId) async {
    emit(GetTruckLocationLoading());
    var result = await customerRepo.customerGetTruckLocation(user, truckId);
    result.fold(
        (faliure) =>
            emit(GetTruckLocationFailure(errMessage: faliure.errMessage)),
        (location) {
      emit(GetTruckLocationSuccess(location: location));
    });
  }
}
