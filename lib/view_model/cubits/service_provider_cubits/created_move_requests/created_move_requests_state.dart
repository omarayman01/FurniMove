part of 'created_move_requests_cubit.dart';

sealed class CreatedMoveRequestsState extends Equatable {
  const CreatedMoveRequestsState();

  @override
  List<Object> get props => [];
}

final class CreatedMoveRequestsInitial extends CreatedMoveRequestsState {}

final class CreatedMoveRequestsSuccess extends CreatedMoveRequestsState {
  final List<RequestModel> requests;

  const CreatedMoveRequestsSuccess({required this.requests});
}

final class CreatedMoveRequestsFailure extends CreatedMoveRequestsState {
  final String errMessage;

  const CreatedMoveRequestsFailure({required this.errMessage});
}

final class CreatedMoveRequestsLoading extends CreatedMoveRequestsState {}
