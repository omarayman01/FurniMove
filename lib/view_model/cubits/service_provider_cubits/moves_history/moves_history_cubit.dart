import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'moves_history_state.dart';

class MovesHistoryCubit extends Cubit<MovesHistoryState> {
  MovesHistoryCubit(this.serviceProviderRepo) : super(MovesHistoryInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> fetchMovesHistory(UserModel user) async {
    emit(MovesHistoryInitial());
    var result = await serviceProviderRepo.fetchMovesHistoryRequests(user);
    result.fold(
        (faliure) => emit(MovesHistoryFailure(errMessage: faliure.errMessage)),
        (requests) {
      emit(MovesHistorySuccess(requests: requests));
    });
  }
}
