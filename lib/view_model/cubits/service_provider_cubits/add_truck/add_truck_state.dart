part of 'add_truck_cubit.dart';

sealed class AddTruckState extends Equatable {
  const AddTruckState();

  @override
  List<Object> get props => [];
}

final class AddTruckInitial extends AddTruckState {}

final class AddTruckSuccess extends AddTruckState {
  final TruckModel truck;

  const AddTruckSuccess({required this.truck});
}

final class AddTruckLoading extends AddTruckState {}

final class AddTruckFailure extends AddTruckState {
  final String errMessage;

  const AddTruckFailure({required this.errMessage});
}
