import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.homeRepo) : super(UsersInitial());
  final AdminRepo homeRepo;
  Future<void> fetchUsers(UserModel user, String role) async {
    emit(UsersInitial());
    var result = await homeRepo.fetchUsersbyRole(user, role);
    result.fold((faliure) => emit(UsersFailure(errMessage: faliure.errMessage)),
        (users) {
      print('successusers');
      emit(UsersSuccess(users: users));
    });
  }
}
