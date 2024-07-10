import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/customer/activity/widgets/current_request_listview.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/current_move/customer_current_move_cubit.dart';

class CurrentRequestScreen extends StatefulWidget {
  const CurrentRequestScreen({super.key});

  @override
  State<CurrentRequestScreen> createState() => _CurrentRequestScreenState();
}

class _CurrentRequestScreenState extends State<CurrentRequestScreen> {
  @override
  void initState() {
    context.read<CustomerCurrentMoveCubit>().fetchCustomerCurrentMove(user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Expanded(child: CurrentRequestListView())],
      ),
    );
  }
}
