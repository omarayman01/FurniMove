part of 'create_move_request_cubit.dart';

sealed class CreateMoveRequestState extends Equatable {
  const CreateMoveRequestState();

  @override
  List<Object> get props => [];
}

final class CreateMoveRequestInitial extends CreateMoveRequestState {}

final class CreateMoveRequestLoading extends CreateMoveRequestState {}

final class CreateMoveRequestFailure extends CreateMoveRequestState {
  final String errMessage;

  const CreateMoveRequestFailure({required this.errMessage});
}

final class CreateMoveRequestSuccess extends CreateMoveRequestState {
  final dynamic response;

  const CreateMoveRequestSuccess({required this.response});
}
