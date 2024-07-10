import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo.dart';

part 'customer_get_address_state.dart';

class CustomerGetAddressCubit extends Cubit<CustomerGetAddressState> {
  CustomerGetAddressCubit(this.customerRepo)
      : super(CustomerGetAddressInitial());
  final CustomerRepo customerRepo;
  Future<void> customerGetAddress(UserModel user, int locationId) async {
    emit(CustomerGetAddressLoading());
    var result = await customerRepo.customerGetAddress(user, locationId);
    result.fold(
        (faliure) =>
            emit(CustomerGetAddressFailure(errMessage: faliure.errMessage)),
        (address) {
      emit(CustomerGetAddressSuccess(address: address));
    });
  }
}
