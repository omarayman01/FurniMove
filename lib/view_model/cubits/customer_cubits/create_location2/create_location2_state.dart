part of 'create_location2_cubit.dart';

sealed class CreateLocation2State extends Equatable {
  const CreateLocation2State();

  @override
  List<Object> get props => [];
}

final class CreateLocation2Initial extends CreateLocation2State {}

final class CreateLocation2Loading extends CreateLocation2State {}

final class CreateLocation2Failure extends CreateLocation2State {
  final String errMessage;

  const CreateLocation2Failure({required this.errMessage});
}

final class CreateLocation2Success extends CreateLocation2State {
  final LocationModel location;

  const CreateLocation2Success({required this.location});
}
