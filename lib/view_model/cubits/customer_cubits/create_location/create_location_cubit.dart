import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/location.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'create_location_state.dart';

class CreateLocationCubit extends Cubit<CreateLocationState> {
  CreateLocationCubit(this.customerRepo) : super(CreateLocationInitial());
  final CustomerRepo customerRepo;
  Future<void> createLocation(UserModel user, Map<String, String> data) async {
    emit(CreateLocationLoading());
    var result = await customerRepo.createLocation(user, data);
    result.fold(
        (faliure) =>
            emit(CreateLocationFailure(errMessage: faliure.errMessage)),
        (location) {
      emit(CreateLocationSuccess(location: location));
    });
  }
}
