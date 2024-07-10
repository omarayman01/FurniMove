part of 'created_requests_cubit.dart';

@immutable
sealed class CreatedRequestsState {}

final class CreatedRequestsInitial extends CreatedRequestsState {}

final class CreatedRequestsLoading extends CreatedRequestsState {}

final class CreatedRequestsFailure extends CreatedRequestsState {
  final String errMessage;

  CreatedRequestsFailure({required this.errMessage});
}

final class CreatedRequestsSuccess extends CreatedRequestsState {
  final List<RequestModel> requests;

  CreatedRequestsSuccess({required this.requests});
}
