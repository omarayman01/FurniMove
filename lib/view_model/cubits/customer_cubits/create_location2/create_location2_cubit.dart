import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/location.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'create_location2_state.dart';

class CreateLocation2Cubit extends Cubit<CreateLocation2State> {
  CreateLocation2Cubit(this.customerRepo) : super(CreateLocation2Initial());
  final CustomerRepo customerRepo;
  Future<void> createLocation2(UserModel user, Map<String, String> data) async {
    emit(CreateLocation2Loading());
    var result = await customerRepo.createLocation(user, data);
    result.fold(
        (faliure) =>
            emit(CreateLocation2Failure(errMessage: faliure.errMessage)),
        (location) {
      emit(CreateLocation2Success(location: location));
    });
  }
}
