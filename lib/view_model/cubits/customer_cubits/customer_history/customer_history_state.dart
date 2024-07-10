part of 'customer_history_cubit.dart';

sealed class CustomerHistoryState extends Equatable {
  const CustomerHistoryState();

  @override
  List<Object> get props => [];
}

final class CustomerHistoryInitial extends CustomerHistoryState {}

final class CustomerHistoryLoading extends CustomerHistoryState {}

final class CustomerHistorySuccess extends CustomerHistoryState {
  final List<RequestModel> requests;

  const CustomerHistorySuccess({required this.requests});
}

final class CustomerHistoryFailure extends CustomerHistoryState {
  final String errMessage;

  const CustomerHistoryFailure({required this.errMessage});
}
