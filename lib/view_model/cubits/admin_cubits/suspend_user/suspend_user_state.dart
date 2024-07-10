part of 'suspend_user_cubit.dart';

sealed class SuspendUserState extends Equatable {
  const SuspendUserState();

  @override
  List<Object> get props => [];
}

final class SuspendUserInitial extends SuspendUserState {}

final class SuspendUserLoading extends SuspendUserState {}

final class SuspendUserFailure extends SuspendUserState {
  final String errMessage;

  const SuspendUserFailure({required this.errMessage});
}

final class SuspendUserSuccess extends SuspendUserState {
  final dynamic respond;

  const SuspendUserSuccess({required this.respond});
}
