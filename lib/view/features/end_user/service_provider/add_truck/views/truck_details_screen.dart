import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/truck.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/add_truck/views/truck_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/add_truck/views/update_truck.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/get_truck/get_truck_cubit.dart';

class TruckDetailsScreen extends StatefulWidget {
  const TruckDetailsScreen({super.key});

  @override
  State<TruckDetailsScreen> createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<GetTruckCubit>().getTruck(user);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: BlocBuilder<GetTruckCubit, GetTruckState>(
          builder: (context, state) {
            if (state is GetTruckSuccess) {
              return Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Row(
                    children: [
                      Text(
                        'Brand  : ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 22),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        state.truck.brand!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Text(
                        'Model  : ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 22),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        state.truck.model!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Text(
                        'Type  : ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 22),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        state.truck.type!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Text(
                        'Year   : ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 22),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        state.truck.year.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Text(
                        'Plate Number : ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 22),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        state.truck.plateNumber!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () {
                      var result = Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateTruck(truck: state.truck),
                        ),
                      ).then((result) async {
                        // Handling the result from the popped screen
                        if (result == true) {
                          print('OMARRRRRRRRRRRRRRRR');
                          await Timer.periodic(const Duration(seconds: 5),
                              (timer) {
                            print('OMARRRRRRRRR2RRRRRRR');
                          });
                          await const Duration(seconds: 5);
                          setState(() {});
                        }
                      });
                    },
                    text: "Update Truck",
                    color: AppTheme.primarylight,
                    radius: 22,
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.5,
                    textColor: AppTheme.white,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              );
            } else if (state is GetTruckLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Error loading truck details"));
            }
          },
        ),
      ),
    );
  }
}
