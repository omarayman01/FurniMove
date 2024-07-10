part of 'update_truck_cubit.dart';

sealed class UpdateTruckState extends Equatable {
  const UpdateTruckState();

  @override
  List<Object> get props => [];
}

final class UpdateTruckInitial extends UpdateTruckState {}

final class UpdateTruckLoading extends UpdateTruckState {}

final class UpdateTruckSuccess extends UpdateTruckState {
  final TruckModel truck;

  const UpdateTruckSuccess({required this.truck});
}

final class UpdateTruckFailure extends UpdateTruckState {
  final String errMessage;

  const UpdateTruckFailure({required this.errMessage});
}
