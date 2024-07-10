import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo.dart';

part 'create_offer_state.dart';

class CreateOfferCubit extends Cubit<CreateOfferState> {
  CreateOfferCubit(this.serviceProviderRepo) : super(CreateOfferInitial());
  final ServiceProviderRepo serviceProviderRepo;
  Future<void> createOffer(UserModel user, Map<String, int> data) async {
    emit(CreateOfferInitial());
    var result = await serviceProviderRepo.createOffer(user, data);
    result.fold(
        (faliure) => emit(CreateOfferFailure(errMessage: faliure.errMessage)),
        (respond) {
      emit(CreateOfferSuccess(respond: respond));
    });
  }
}
