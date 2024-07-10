part of 'end_move_cubit.dart';

sealed class EndMoveState extends Equatable {
  const EndMoveState();

  @override
  List<Object> get props => [];
}

final class EndMoveInitial extends EndMoveState {}

final class EndMoveLoading extends EndMoveState {}

final class EndMoveFailure extends EndMoveState {
  final String errMessage;

  const EndMoveFailure({required this.errMessage});
}

final class EndMoveSuccess extends EndMoveState {
  final dynamic result;

  const EndMoveSuccess({required this.result});
}
