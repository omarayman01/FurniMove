import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_current_offer.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_moves_listview.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer_listview.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/current_move/current_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/moves_history/moves_history_cubit.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo_impl.dart';

class ProviderActivityScreen extends StatelessWidget {
  const ProviderActivityScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CurrentMoveCubit(ServiceProviderRepoImpl())
              ..fetchCurrentMove(user)),
        BlocProvider(
            create: (context) => MovesHistoryCubit(ServiceProviderRepoImpl())
              ..fetchMovesHistory(user)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Activity'),
        ),
        body: Column(
          children: [
            // const LogoColumn(),
            Expanded(
              child: ContainedTabBarView(
                tabs: const [
                  Text('Current Move'),
                  Text('Moves History'),
                  Text('Offers'),
                ],
                views: const [
                  ServiceProviderCurrentOffer(),
                  ServiceProviderMovesListView(),
                  ServiceProviderOffersListView(),
                ],
                // onChange: (index) => print(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
