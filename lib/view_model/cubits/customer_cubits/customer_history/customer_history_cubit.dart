import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'customer_history_state.dart';

class CustomerHistoryCubit extends Cubit<CustomerHistoryState> {
  CustomerHistoryCubit(this.customerRepo) : super(CustomerHistoryInitial());
  final CustomerRepo customerRepo;
  Future<void> fetchCustomerHistory(UserModel user) async {
    emit(CustomerHistoryLoading());
    var result = await customerRepo.getHistory(user);
    result.fold(
        (faliure) =>
            emit(CustomerHistoryFailure(errMessage: faliure.errMessage)),
        (requests) {
      emit(CustomerHistorySuccess(requests: requests));
    });
  }
}
