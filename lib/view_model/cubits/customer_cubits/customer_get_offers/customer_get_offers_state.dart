part of 'customer_get_offers_cubit.dart';

sealed class CustomerGetOffersState extends Equatable {
  const CustomerGetOffersState();

  @override
  List<Object> get props => [];
}

final class CustomerGetOffersInitial extends CustomerGetOffersState {}

final class CustomerGetOffersLoading extends CustomerGetOffersState {}

final class CustomerGetOffersFailure extends CustomerGetOffersState {
  final String errMessage;

  const CustomerGetOffersFailure({required this.errMessage});
}

final class CustomerGetOffersSuccess extends CustomerGetOffersState {
  final List<OfferModel> offers;

  const CustomerGetOffersSuccess({required this.offers});
}
