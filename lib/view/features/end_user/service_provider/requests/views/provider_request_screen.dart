import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/widgets/requests_listview.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/created_move_requests/created_move_requests_cubit.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo_impl.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatedMoveRequestsCubit(ServiceProviderRepoImpl())
        ..fetchCreatedMoveRequests(user),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Requests'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: RequestsListView()),
          ],
        ),
      ),
    );
  }
}
