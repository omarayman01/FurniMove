import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/custom_container_reports.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/created_requests/created_requests_cubit.dart';

class CreatedRequestsListView extends StatelessWidget {
  const CreatedRequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatedRequestsCubit, CreatedRequestsState>(
      builder: (context, state) {
        if (state is CreatedRequestsSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return CustomContainerReports(
                request: state.requests[index],
                user: user,
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is CreatedRequestsFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
