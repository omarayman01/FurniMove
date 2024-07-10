import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/add_truck/views/add_truck.dart';
import 'package:furni_move/view/features/end_user/service_provider/add_truck/views/truck_details_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/add_truck/views/update_truck.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/get_truck/get_truck_cubit.dart';

class TruckScreen extends StatefulWidget {
  const TruckScreen({super.key});
  @override
  State<TruckScreen> createState() => _TruckScreenState();
}

class _TruckScreenState extends State<TruckScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetTruckCubit>().getTruck(user);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTruckCubit, GetTruckState>(
      builder: (context, state) {
        if (state is GetTruckSuccess) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Truck'),
              ),
              body: Column(
                children: [
                  // const LogoColumn(),
                  Expanded(
                    child: ContainedTabBarView(
                      tabs: const [
                        // Text('Add Truck'),
                        Text('Update Truck'),
                      ],
                      views: [
                        // const AddTruckScreen(),
                        // UpdateTruck(
                        //   truck: state.truck,
                        // ),
                        TruckDetailsScreen(
                            // truck: state.truck,
                            ),
                      ],
                      // onChange: (index) => print(index),
                    ),
                  ),
                ],
              ));
        } else if (state is GetTruckFailure) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Truck'),
              ),
              body: Column(
                children: [
                  // const LogoColumn(),
                  Expanded(
                    child: ContainedTabBarView(
                      tabs: const [
                        Text('Add Truck'),
                        // Text('Update Truck'),
                      ],
                      views: const [
                        AddTruckScreen(),
                        // UpdateTruck(
                        //   truck: state.truck,
                        // ),
                      ],
                      // onChange: (index) => print(index),
                    ),
                  ),
                ],
              ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
