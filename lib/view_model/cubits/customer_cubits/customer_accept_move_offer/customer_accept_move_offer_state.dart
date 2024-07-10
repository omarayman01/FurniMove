part of 'customer_accept_move_offer_cubit.dart';

sealed class CustomerAcceptMoveOfferState extends Equatable {
  const CustomerAcceptMoveOfferState();

  @override
  List<Object> get props => [];
}

final class CustomerAcceptMoveOfferInitial
    extends CustomerAcceptMoveOfferState {}

final class CustomerAcceptMoveOfferLoading
    extends CustomerAcceptMoveOfferState {}

final class CustomerAcceptMoveOfferFailure
    extends CustomerAcceptMoveOfferState {
  final String errMessage;

  const CustomerAcceptMoveOfferFailure({required this.errMessage});
}

final class CustomerAcceptMoveOfferSuccess
    extends CustomerAcceptMoveOfferState {
  final dynamic response;

  const CustomerAcceptMoveOfferSuccess({required this.response});
}
