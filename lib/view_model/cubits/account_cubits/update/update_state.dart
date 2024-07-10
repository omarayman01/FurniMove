part of 'update_cubit.dart';

sealed class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

final class UpdateInitial extends UpdateState {}

final class UpdateLoading extends UpdateState {}

final class UpdateSuccess extends UpdateState {
  final dynamic respose;

  const UpdateSuccess({required this.respose});
}

final class UpdateFailure extends UpdateState {
  final String errMessage;

  const UpdateFailure({required this.errMessage});
}
