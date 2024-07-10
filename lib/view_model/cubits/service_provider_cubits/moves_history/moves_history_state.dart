part of 'moves_history_cubit.dart';

sealed class MovesHistoryState extends Equatable {
  const MovesHistoryState();

  @override
  List<Object> get props => [];
}

final class MovesHistoryInitial extends MovesHistoryState {}

final class MovesHistoryLoading extends MovesHistoryState {}

final class MovesHistoryFailure extends MovesHistoryState {
  final String errMessage;

  const MovesHistoryFailure({required this.errMessage});
}

final class MovesHistorySuccess extends MovesHistoryState {
  final List<RequestModel> requests;

  const MovesHistorySuccess({required this.requests});
}
