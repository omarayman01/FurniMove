import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/end_user/customer/activity/widgets/rate_form.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_history/customer_history_cubit.dart';

class MovesHistoryListView extends StatelessWidget {
  const MovesHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerHistoryCubit, CustomerHistoryState>(
      builder: (context, state) {
        if (state is CustomerHistorySuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return MoveCard(
                request: state.requests[index],
                rate: true,
                doRate: true,
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is CustomerHistoryFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
