import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/moves_history/moves_history_cubit.dart';

class ServiceProviderMovesListView extends StatefulWidget {
  const ServiceProviderMovesListView({super.key});

  @override
  State<ServiceProviderMovesListView> createState() =>
      _ServiceProviderMovesListViewState();
}

class _ServiceProviderMovesListViewState
    extends State<ServiceProviderMovesListView> {
  @override
  void initState() {
    context.read<MovesHistoryCubit>().fetchMovesHistory(user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovesHistoryCubit, MovesHistoryState>(
      builder: (context, state) {
        if (state is MovesHistorySuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return MoveCard(
                request: state.requests[index],
                rate: true,
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is MovesHistoryFailure) {
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
