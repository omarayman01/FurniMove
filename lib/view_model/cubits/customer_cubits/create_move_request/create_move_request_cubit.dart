import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'create_move_request_state.dart';

class CreateMoveRequestCubit extends Cubit<CreateMoveRequestState> {
  CreateMoveRequestCubit(this.customerRepo) : super(CreateMoveRequestInitial());
  final CustomerRepo customerRepo;
  Future<void> createMoveRequest(
      UserModel user, Map<String, dynamic> data) async {
    emit(CreateMoveRequestLoading());
    var result = await customerRepo.customerCreateMoveRequest(user, data);
    result.fold(
        (faliure) =>
            emit(CreateMoveRequestFailure(errMessage: faliure.errMessage)),
        (response) {
      emit(CreateMoveRequestSuccess(response: response));
    });
  }
}
