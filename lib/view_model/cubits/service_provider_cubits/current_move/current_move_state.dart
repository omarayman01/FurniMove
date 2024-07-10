part of 'current_move_cubit.dart';

sealed class CurrentMoveState extends Equatable {
  const CurrentMoveState();

  @override
  List<Object> get props => [];
}

final class CurrentMoveInitial extends CurrentMoveState {}

final class CurrentMoveLoading extends CurrentMoveState {}

final class CurrentMoveSuccess extends CurrentMoveState {
  final RequestModel request;

  const CurrentMoveSuccess({required this.request});
}

final class CurrentMoveFailure extends CurrentMoveState {
  final String errMessage;

  const CurrentMoveFailure({required this.errMessage});
}
