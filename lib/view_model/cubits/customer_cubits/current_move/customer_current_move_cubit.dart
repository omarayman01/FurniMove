import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'customer_current_move_state.dart';

class CustomerCurrentMoveCubit extends Cubit<CustomerCurrentMoveState> {
  CustomerCurrentMoveCubit(this.customerRepo)
      : super(CustomerCurrentMoveInitial());
  final CustomerRepo customerRepo;
  Future<void> fetchCustomerCurrentMove(UserModel user) async {
    emit(CustomerCurrentMoveLoading());
    var result = await customerRepo.customerGetCurrentMove(user);
    result.fold(
        (faliure) =>
            emit(CustomerCurrentMoveFailure(errMessage: faliure.errMessage)),
        (request) {
      emit(CustomerCurrentMoveSuccess(request: request));
    });
  }
}
