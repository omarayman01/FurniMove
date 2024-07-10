import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this.adminRepo) : super(OffersInitial());
  final AdminRepo adminRepo;
  Future<void> fetchOffersbyId(UserModel user, String id) async {
    emit(OffersLoading());
    print('in cubit');
    var result = await adminRepo.fetchOffersByRequestId(id, user);
    result
        .fold((faliure) => emit(OffersFailure(errMessage: faliure.errMessage)),
            (offers) {
      print('right');
      emit(OffersSuccess(offers: offers));
    });
  }
}
