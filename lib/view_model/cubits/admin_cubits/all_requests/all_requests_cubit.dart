import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

part 'all_requests_state.dart';

class AllRequestsCubit extends Cubit<AllRequestsState> {
  AllRequestsCubit(this.adminRepo) : super(AllRequestsInitial());
  final AdminRepo adminRepo;
  Future<void> fetchAllRequests(UserModel user) async {
    emit(AllRequestsLoading());
    var result = await adminRepo.fetchAllRequests(user);
    result.fold(
        (faliure) => emit(AllRequestsFailure(errMessage: faliure.errMessage)),
        (requests) {
      emit(AllRequestsSuccess(requests: requests));
    });
  }
}
