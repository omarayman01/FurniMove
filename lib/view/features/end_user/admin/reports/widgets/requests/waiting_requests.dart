import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/custom_container_reports.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/waiting_requests/waiting_requests_cubit.dart';

class WaitingRequestsListView extends StatelessWidget {
  const WaitingRequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaitingRequestsCubit, WaitingRequestsState>(
      builder: (context, state) {
        if (state is WaitingRequestsSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return CustomContainerReports(
                request: state.requests[index],
                user: user,
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is WaitingRequestsFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
