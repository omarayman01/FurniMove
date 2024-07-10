part of 'rate_cubit.dart';

sealed class RateState extends Equatable {
  const RateState();

  @override
  List<Object> get props => [];
}

final class RateInitial extends RateState {}

final class RateLoading extends RateState {}

final class RateSuccess extends RateState {
  final dynamic response;

  const RateSuccess({required this.response});
}

final class RateFailure extends RateState {
  final String errMessage;

  const RateFailure({required this.errMessage});
}
