import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/offer_container.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_get_offers/customer_get_offers_cubit.dart';

class CustomerOffersListView extends StatelessWidget {
  const CustomerOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerGetOffersCubit, CustomerGetOffersState>(
      builder: (context, state) {
        if (state is CustomerGetOffersSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return OfferContainer(
                offer: state.offers[index],
                isCustomer: true,
              );
            },
            itemCount: state.offers.length,
            // itemCount: 10,
          );
        } else if (state is CustomerGetOffersFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
