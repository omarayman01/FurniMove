import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

part 'suspend_user_state.dart';

class SuspendUserCubit extends Cubit<SuspendUserState> {
  SuspendUserCubit(this.adminRepo) : super(SuspendUserInitial());
  final AdminRepo adminRepo;
  Future<void> fetchSuspendUser(UserModel user, String userId) async {
    emit(SuspendUserLoading());
    var result = await adminRepo.suspendUser(userId, user);
    result.fold(
        (faliure) => emit(SuspendUserFailure(errMessage: faliure.errMessage)),
        (respond) {
      emit(SuspendUserSuccess(respond: respond));
    });
  }
}
