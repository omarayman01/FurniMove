part of 'customer_get_address_cubit.dart';

sealed class CustomerGetAddressState extends Equatable {
  const CustomerGetAddressState();

  @override
  List<Object> get props => [];
}

final class CustomerGetAddressInitial extends CustomerGetAddressState {}

final class CustomerGetAddressLoading extends CustomerGetAddressState {}

final class CustomerGetAddressFailure extends CustomerGetAddressState {
  final String errMessage;

  const CustomerGetAddressFailure({required this.errMessage});
}

final class CustomerGetAddressSuccess extends CustomerGetAddressState {
  final String address;

  const CustomerGetAddressSuccess({required this.address});
}
