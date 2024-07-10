part of 'serviceprovider_all_offers_cubit.dart';

sealed class ServiceproviderAllOffersState extends Equatable {
  const ServiceproviderAllOffersState();

  @override
  List<Object> get props => [];
}

final class ServiceproviderAllOffersInitial
    extends ServiceproviderAllOffersState {}

final class ServiceproviderAllOffersLoading
    extends ServiceproviderAllOffersState {}

final class ServiceproviderAllOffersFailure
    extends ServiceproviderAllOffersState {
  final String errMessage;

  const ServiceproviderAllOffersFailure({required this.errMessage});
}

final class ServiceproviderAllOffersSuccess
    extends ServiceproviderAllOffersState {
  final List<OfferModel> offers;

  const ServiceproviderAllOffersSuccess({required this.offers});
}
