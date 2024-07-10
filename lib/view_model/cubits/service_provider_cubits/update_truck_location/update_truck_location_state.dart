part of 'update_truck_location_cubit.dart';

sealed class UpdateTruckLocationState extends Equatable {
  const UpdateTruckLocationState();

  @override
  List<Object> get props => [];
}

final class UpdateTruckLocationInitial extends UpdateTruckLocationState {}

final class UpdateTruckLocationLoading extends UpdateTruckLocationState {}

final class UpdateTruckLocationFailure extends UpdateTruckLocationState {
  final String errMessage;

  const UpdateTruckLocationFailure({required this.errMessage});
}

final class UpdateTruckLocationSuccess extends UpdateTruckLocationState {
  final dynamic respond;

  const UpdateTruckLocationSuccess({required this.respond});
}
