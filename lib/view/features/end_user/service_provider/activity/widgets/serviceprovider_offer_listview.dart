import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/offer_card.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/service_provider_all_offers/serviceprovider_all_offers_cubit.dart';

class ServiceProviderOffersListView extends StatefulWidget {
  const ServiceProviderOffersListView({super.key});

  @override
  State<ServiceProviderOffersListView> createState() =>
      _ServiceProviderOffersListViewState();
}

class _ServiceProviderOffersListViewState
    extends State<ServiceProviderOffersListView> {
  @override
  void initState() {
    context
        .read<ServiceproviderAllOffersCubit>()
        .fetchServiceproviderAllOffers(user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceproviderAllOffersCubit,
        ServiceproviderAllOffersState>(
      builder: (context, state) {
        if (state is ServiceproviderAllOffersSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return OfferCard(
                offer: state.offers[index],
              );
            },
            itemCount: state.offers.length,
          );
        } else if (state is ServiceproviderAllOffersFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
