part of 'start_move_cubit.dart';

sealed class StartMoveState extends Equatable {
  const StartMoveState();

  @override
  List<Object> get props => [];
}

final class StartMoveInitial extends StartMoveState {}

final class StartMoveLoading extends StartMoveState {}

final class StartMoveFailure extends StartMoveState {
  final String errMessage;

  const StartMoveFailure({required this.errMessage});
}

final class StartMoveSuccess extends StartMoveState {
  final dynamic result;

  const StartMoveSuccess({required this.result});
}
