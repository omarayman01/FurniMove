import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

part 'waiting_requests_state.dart';

class WaitingRequestsCubit extends Cubit<WaitingRequestsState> {
  WaitingRequestsCubit(this.adminRepo) : super(WaitingRequestsInitial());
  final AdminRepo adminRepo;
  Future<void> fetchWaitingRequests(UserModel user) async {
    emit(WaitingRequestsLoading());
    var result = await adminRepo.fetchWaitingRequests(user);
    result.fold(
        (faliure) =>
            emit(WaitingRequestsFailure(errMessage: faliure.errMessage)),
        (requests) {
      emit(WaitingRequestsSuccess(requests: requests));
    });
  }
}
