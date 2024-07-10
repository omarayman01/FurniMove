part of 'add_appliance_cubit.dart';

sealed class AddApplianceState extends Equatable {
  const AddApplianceState();

  @override
  List<Object> get props => [];
}

final class AddApplianceInitial extends AddApplianceState {}

final class AddApplianceLoading extends AddApplianceState {}

final class AddApplianceFailure extends AddApplianceState {
  final String errMessage;

  const AddApplianceFailure({required this.errMessage});
}

final class AddApplianceSuccess extends AddApplianceState {
  final ApplianceModel appliance;

  const AddApplianceSuccess({required this.appliance});
}
