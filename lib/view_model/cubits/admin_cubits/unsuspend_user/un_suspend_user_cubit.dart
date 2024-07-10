import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

part 'un_suspend_user_state.dart';

class UnSuspendUserCubit extends Cubit<UnSuspendUserState> {
  UnSuspendUserCubit(this.adminRepo) : super(UnSuspendUserInitial());
  final AdminRepo adminRepo;
  Future<void> fetchUnSuspendUser(UserModel user, String userId) async {
    emit(UnSuspendUserLoading());
    var result = await adminRepo.unSuspendUser(userId, user);
    result.fold(
        (faliure) => emit(UnSuspendUserFailure(errMessage: faliure.errMessage)),
        (respond) {
      emit(UnSuspendUserSuccess(respond: respond));
    });
  }
}
