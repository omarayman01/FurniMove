import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

part 'on_going_requests_state.dart';

class OnGoingRequestsCubit extends Cubit<OnGoingRequestsState> {
  OnGoingRequestsCubit(this.adminRepo) : super(OnGoingRequestsInitial());
  final AdminRepo adminRepo;
  Future<void> fetchOnGoingRequests(UserModel user) async {
    emit(OnGoingRequestsLoading());
    var result = await adminRepo.fetchOnGoingRequests(user);
    result.fold(
        (faliure) =>
            emit(OnGoingRequestsFailure(errMessage: faliure.errMessage)),
        (requests) {
      emit(OnGoingRequestsSuccess(requests: requests));
    });
  }
}
