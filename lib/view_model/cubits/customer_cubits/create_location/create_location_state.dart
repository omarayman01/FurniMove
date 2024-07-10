part of 'create_location_cubit.dart';

sealed class CreateLocationState extends Equatable {
  const CreateLocationState();

  @override
  List<Object> get props => [];
}

final class CreateLocationInitial extends CreateLocationState {}

final class CreateLocationLoading extends CreateLocationState {}

final class CreateLocationFailure extends CreateLocationState {
  final String errMessage;

  const CreateLocationFailure({required this.errMessage});
}

final class CreateLocationSuccess extends CreateLocationState {
  final LocationModel location;

  const CreateLocationSuccess({required this.location});
}
