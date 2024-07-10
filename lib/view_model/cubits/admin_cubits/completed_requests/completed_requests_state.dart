part of 'completed_requests_cubit.dart';

sealed class CompletedRequestsState extends Equatable {
  const CompletedRequestsState();

  @override
  List<Object> get props => [];
}

final class CompletedRequestsInitial extends CompletedRequestsState {}

final class CompletedRequestsLoading extends CompletedRequestsState {}

final class CompletedRequestsFailure extends CompletedRequestsState {
  final String errMessage;

  const CompletedRequestsFailure({required this.errMessage});
}

final class CompletedRequestsSuccess extends CompletedRequestsState {
  final List<RequestModel> requests;

  const CompletedRequestsSuccess({required this.requests});
}
