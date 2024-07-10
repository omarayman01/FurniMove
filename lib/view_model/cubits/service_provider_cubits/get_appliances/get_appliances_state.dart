part of 'get_appliances_cubit.dart';

sealed class GetAppliancesState extends Equatable {
  const GetAppliancesState();

  @override
  List<Object> get props => [];
}

final class GetAppliancesInitial extends GetAppliancesState {}

final class GetAppliancesLoading extends GetAppliancesState {}

final class GetAppliancesFailure extends GetAppliancesState {
  final String errMessage;

  const GetAppliancesFailure({required this.errMessage});
}

final class GetAppliancesSuccess extends GetAppliancesState {
  final List<ApplianceModel> appliances;

  const GetAppliancesSuccess({required this.appliances});
}
