import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';

import '../../../repos/service_provider/serviceprovider_repo.dart';

part 'current_move_state.dart';

class CurrentMoveCubit extends Cubit<CurrentMoveState> {
  CurrentMoveCubit(this.serviceProviderRepo) : super(CurrentMoveInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> fetchCurrentMove(UserModel user) async {
    emit(CurrentMoveInitial());
    var result = await serviceProviderRepo.fetchCurrentMoveRequest(user);
    result.fold(
        (faliure) => emit(CurrentMoveFailure(errMessage: faliure.errMessage)),
        (request) {
      emit(CurrentMoveSuccess(request: request));
    });
  }
}
