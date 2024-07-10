part of 'get_truck_cubit.dart';

sealed class GetTruckState extends Equatable {
  const GetTruckState();

  @override
  List<Object> get props => [];
}

final class GetTruckInitial extends GetTruckState {}

final class GetTruckLoading extends GetTruckState {}

final class GetTruckSuccess extends GetTruckState {
  final TruckModel truck;

  const GetTruckSuccess({required this.truck});
}

final class GetTruckFailure extends GetTruckState {
  final String errMessage;

  const GetTruckFailure({required this.errMessage});
}
