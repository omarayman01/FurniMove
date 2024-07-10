import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'rate_state.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit(this.customerRepo) : super(RateInitial());
  final CustomerRepo customerRepo;
  Future<void> rateMove(UserModel user, int moveID, int rate) async {
    emit(RateLoading());
    var result = await customerRepo.customerRateMove(user, moveID, rate);
    result.fold((faliure) => emit(RateFailure(errMessage: faliure.errMessage)),
        (response) {
      emit(RateSuccess(response: response));
    });
  }
}
