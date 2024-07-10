import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'customer_accept_move_offer_state.dart';

class CustomerAcceptMoveOfferCubit extends Cubit<CustomerAcceptMoveOfferState> {
  CustomerAcceptMoveOfferCubit(this.customerRepo)
      : super(CustomerAcceptMoveOfferInitial());
  final CustomerRepo customerRepo;
  Future<void> customerAcceptMoveOffer(UserModel user, int moveOfferId) async {
    emit(CustomerAcceptMoveOfferLoading());
    var result = await customerRepo.customerAcceptMoveOffer(user, moveOfferId);
    result.fold(
        (faliure) => emit(
            CustomerAcceptMoveOfferFailure(errMessage: faliure.errMessage)),
        (response) {
      emit(CustomerAcceptMoveOfferSuccess(response: response));
    });
  }
}
