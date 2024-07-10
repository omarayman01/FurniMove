import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/custom_container_reports.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/ongoing_requests/on_going_requests_cubit.dart';

class OnGoingRequests extends StatelessWidget {
  const OnGoingRequests({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnGoingRequestsCubit, OnGoingRequestsState>(
      builder: (context, state) {
        if (state is OnGoingRequestsSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return CustomContainerReports(
                request: state.requests[index],
                user: user,
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is OnGoingRequestsFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
