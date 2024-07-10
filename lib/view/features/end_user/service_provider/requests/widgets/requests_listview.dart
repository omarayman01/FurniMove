import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/widgets/request_card.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/created_move_requests/created_move_requests_cubit.dart';

class RequestsListView extends StatelessWidget {
  const RequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatedMoveRequestsCubit, CreatedMoveRequestsState>(
      builder: (context, state) {
        if (state is CreatedMoveRequestsSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return RequestsCard(
                request: state.requests[index],
              );
            },
            itemCount: state.requests.length,
          );
        } else if (state is CreatedMoveRequestsFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
