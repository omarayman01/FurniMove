import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

part 'completed_requests_state.dart';

class CompletedRequestsCubit extends Cubit<CompletedRequestsState> {
  CompletedRequestsCubit(this.homeRepo) : super(CompletedRequestsInitial());
  final AdminRepo homeRepo;
  Future<void> fetchCompletedRequests(UserModel user) async {
    emit(CompletedRequestsInitial());
    var result = await homeRepo.fetchCompletedRequests(user);
    result.fold(
        (faliure) =>
            emit(CompletedRequestsFailure(errMessage: faliure.errMessage)),
        (requests) {
      emit(CompletedRequestsSuccess(requests: requests));
    });
  }
}
