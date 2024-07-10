import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/request_map_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/current_move/current_move_cubit.dart';

class ServiceProviderCurrentOffer extends StatefulWidget {
  const ServiceProviderCurrentOffer({
    super.key,
  });

  @override
  State<ServiceProviderCurrentOffer> createState() =>
      _ServiceProviderCurrentOfferState();
}

class _ServiceProviderCurrentOfferState
    extends State<ServiceProviderCurrentOffer> {
  @override
  void initState() {
    context.read<CurrentMoveCubit>().fetchCurrentMove(user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentMoveCubit, CurrentMoveState>(
      builder: (context, state) {
        if (state is CurrentMoveSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return MoveCard(request: state.request, map: true
                  // rate: true,
                  );
            },
            itemCount: 1,
          );
        } else if (state is CurrentMoveFailure) {
          return const Center(
            child: Text(''),
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
