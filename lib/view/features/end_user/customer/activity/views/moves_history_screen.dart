import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/customer/activity/widgets/moves_history_listview.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_history/customer_history_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/add_truck/add_truck_cubit.dart';

class MovesHistoryScreen extends StatefulWidget {
  const MovesHistoryScreen({super.key});

  @override
  State<MovesHistoryScreen> createState() => _MovesHistoryScreenState();
}

class _MovesHistoryScreenState extends State<MovesHistoryScreen> {
  @override
  void initState() {
    context.read<CustomerHistoryCubit>().fetchCustomerHistory(user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Expanded(child: MovesHistoryListView())],
      ),
    );
  }
}
