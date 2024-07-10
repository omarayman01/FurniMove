import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'customer_get_offers_state.dart';

class CustomerGetOffersCubit extends Cubit<CustomerGetOffersState> {
  CustomerGetOffersCubit(this.customerRepo) : super(CustomerGetOffersInitial());
  final CustomerRepo customerRepo;
  Future<void> fetchCustomerOffers(UserModel user) async {
    emit(CustomerGetOffersLoading());
    var result = await customerRepo.customerGetOffers(user);
    result.fold(
        (faliure) =>
            emit(CustomerGetOffersFailure(errMessage: faliure.errMessage)),
        (offers) {
      emit(CustomerGetOffersSuccess(offers: offers));
    });
  }
}
