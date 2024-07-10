import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/offer_container.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/offers/offers_cubit.dart';

class ListViewOffers extends StatelessWidget {
  const ListViewOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return OfferContainer(
                  // color: AppTheme.primarylight.withOpacity(0.1),
                  offer: state.offers[index]);
            },
            itemCount: state.offers.length,
            // itemCount: 10,
          );
        } else if (state is OffersFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
