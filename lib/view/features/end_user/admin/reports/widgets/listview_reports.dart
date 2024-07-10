import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/custom_container_reports.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/all_requests/all_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/ongoing_requests/on_going_requests_cubit.dart';

class ListViewReports extends StatelessWidget {
  const ListViewReports({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllRequestsCubit, AllRequestsState>(
      builder: (context, state) {
        if (state is AllRequestsSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return CustomContainerReports(
                request: state.requests[index],
                user: user,
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is AllRequestsFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
