part of 'un_suspend_user_cubit.dart';

sealed class UnSuspendUserState extends Equatable {
  const UnSuspendUserState();

  @override
  List<Object> get props => [];
}

final class UnSuspendUserInitial extends UnSuspendUserState {}

final class UnSuspendUserLoading extends UnSuspendUserState {}

final class UnSuspendUserFailure extends UnSuspendUserState {
  final String errMessage;

  const UnSuspendUserFailure({required this.errMessage});
}

final class UnSuspendUserSuccess extends UnSuspendUserState {
  final dynamic respond;

  const UnSuspendUserSuccess({required this.respond});
}
