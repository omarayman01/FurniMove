part of 'waiting_requests_cubit.dart';

sealed class WaitingRequestsState extends Equatable {
  const WaitingRequestsState();

  @override
  List<Object> get props => [];
}

final class WaitingRequestsInitial extends WaitingRequestsState {}

final class WaitingRequestsLoading extends WaitingRequestsState {}

final class WaitingRequestsFailure extends WaitingRequestsState {
  final String errMessage;

  const WaitingRequestsFailure({required this.errMessage});
}

final class WaitingRequestsSuccess extends WaitingRequestsState {
  final List<RequestModel> requests;

  const WaitingRequestsSuccess({required this.requests});
}
