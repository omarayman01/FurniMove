part of 'customer_current_move_cubit.dart';

sealed class CustomerCurrentMoveState extends Equatable {
  const CustomerCurrentMoveState();

  @override
  List<Object> get props => [];
}

final class CustomerCurrentMoveInitial extends CustomerCurrentMoveState {}

final class CustomerCurrentMoveLoading extends CustomerCurrentMoveState {}

final class CustomerCurrentMoveFailure extends CustomerCurrentMoveState {
  final String errMessage;

  const CustomerCurrentMoveFailure({required this.errMessage});
}

final class CustomerCurrentMoveSuccess extends CustomerCurrentMoveState {
  final RequestModel request;

  const CustomerCurrentMoveSuccess({required this.request});
}
