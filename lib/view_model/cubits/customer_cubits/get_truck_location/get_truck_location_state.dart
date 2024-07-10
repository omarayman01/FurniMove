part of 'get_truck_location_cubit.dart';

sealed class GetTruckLocationState extends Equatable {
  const GetTruckLocationState();

  @override
  List<Object> get props => [];
}

final class GetTruckLocationInitial extends GetTruckLocationState {}

final class GetTruckLocationLoading extends GetTruckLocationState {}

final class GetTruckLocationFailure extends GetTruckLocationState {
  final String errMessage;

  const GetTruckLocationFailure({required this.errMessage});
}

final class GetTruckLocationSuccess extends GetTruckLocationState {
  final LocationModel location;

  const GetTruckLocationSuccess({required this.location});
}
