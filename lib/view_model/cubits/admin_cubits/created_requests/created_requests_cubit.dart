import 'package:bloc/bloc.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';
import 'package:meta/meta.dart';

part 'created_requests_state.dart';

class CreatedRequestsCubit extends Cubit<CreatedRequestsState> {
  CreatedRequestsCubit(
    this.homeRepo,
  ) : super(CreatedRequestsInitial());
  final AdminRepo homeRepo;
  Future<void> fetchCreatedRequests(UserModel user) async {
    emit(CreatedRequestsLoading());
    var result = await homeRepo.fetchCreatedRequests(user);
    result.fold(
        (faliure) =>
            emit(CreatedRequestsFailure(errMessage: faliure.errMessage)),
        (requests) {
      emit(CreatedRequestsSuccess(requests: requests));
    });
  }
}
