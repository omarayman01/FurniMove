import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'serviceprovider_all_offers_state.dart';

class ServiceproviderAllOffersCubit
    extends Cubit<ServiceproviderAllOffersState> {
  ServiceproviderAllOffersCubit(this.serviceProviderRepo)
      : super(ServiceproviderAllOffersInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> fetchServiceproviderAllOffers(UserModel user) async {
    emit(ServiceproviderAllOffersLoading());
    var result = await serviceProviderRepo.fetchAllOffers(user);
    result.fold(
        (faliure) => emit(
            ServiceproviderAllOffersFailure(errMessage: faliure.errMessage)),
        (offers) {
      emit(ServiceproviderAllOffersSuccess(offers: offers));
    });
  }
}
