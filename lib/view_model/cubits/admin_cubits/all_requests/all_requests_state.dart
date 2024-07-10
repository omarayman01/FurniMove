part of 'all_requests_cubit.dart';

sealed class AllRequestsState extends Equatable {
  const AllRequestsState();

  @override
  List<Object> get props => [];
}

final class AllRequestsInitial extends AllRequestsState {}

final class AllRequestsLoading extends AllRequestsState {}

final class AllRequestsFailure extends AllRequestsState {
  final String errMessage;

  const AllRequestsFailure({required this.errMessage});
}

final class AllRequestsSuccess extends AllRequestsState {
  final List<RequestModel> requests;

  const AllRequestsSuccess({required this.requests});
}
