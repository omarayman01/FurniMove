import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/custom_container_reports.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/completed_requests/completed_requests_cubit.dart';

class CompletedRequests extends StatelessWidget {
  const CompletedRequests({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedRequestsCubit, CompletedRequestsState>(
      builder: (context, state) {
        if (state is CompletedRequestsSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return CustomContainerReports(
                user: user,
                request: state.requests[index],
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is CompletedRequestsFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
