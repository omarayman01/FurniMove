part of 'on_going_requests_cubit.dart';

sealed class OnGoingRequestsState extends Equatable {
  const OnGoingRequestsState();

  @override
  List<Object> get props => [];
}

final class OnGoingRequestsInitial extends OnGoingRequestsState {}

final class OnGoingRequestsFailure extends OnGoingRequestsState {
  final String errMessage;

  const OnGoingRequestsFailure({required this.errMessage});
}

final class OnGoingRequestsLoading extends OnGoingRequestsState {}

final class OnGoingRequestsSuccess extends OnGoingRequestsState {
  final List<RequestModel> requests;

  const OnGoingRequestsSuccess({required this.requests});
}
