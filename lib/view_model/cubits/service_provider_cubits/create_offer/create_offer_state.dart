part of 'create_offer_cubit.dart';

sealed class CreateOfferState extends Equatable {
  const CreateOfferState();

  @override
  List<Object> get props => [];
}

final class CreateOfferInitial extends CreateOfferState {}

final class CreateOfferLoading extends CreateOfferState {}

final class CreateOfferSuccess extends CreateOfferState {
  final dynamic respond;

  const CreateOfferSuccess({required this.respond});
}

final class CreateOfferFailure extends CreateOfferState {
  final String errMessage;

  const CreateOfferFailure({required this.errMessage});
}
