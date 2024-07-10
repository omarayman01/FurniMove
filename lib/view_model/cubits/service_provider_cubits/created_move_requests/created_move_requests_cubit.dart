import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'created_move_requests_state.dart';

class CreatedMoveRequestsCubit extends Cubit<CreatedMoveRequestsState> {
  CreatedMoveRequestsCubit(this.serviceProviderRepo)
      : super(CreatedMoveRequestsInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> fetchCreatedMoveRequests(UserModel user) async {
    emit(CreatedMoveRequestsInitial());
    var result = await serviceProviderRepo.fetchCreatedMoveRequests(user);
    result.fold(
        (faliure) =>
            emit(CreatedMoveRequestsFailure(errMessage: faliure.errMessage)),
        (requests) {
      emit(CreatedMoveRequestsSuccess(requests: requests));
    });
  }
}
