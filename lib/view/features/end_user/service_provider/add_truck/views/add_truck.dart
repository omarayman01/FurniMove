import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/add_truck/add_truck_cubit.dart';

class AddTruckScreen extends StatefulWidget {
  const AddTruckScreen({super.key});

  @override
  State<AddTruckScreen> createState() => _AddTruckScreenState();
}

class _AddTruckScreenState extends State<AddTruckScreen> {
  var plateNumberController = TextEditingController();
  var brandController = TextEditingController();
  var modelController = TextEditingController();
  var yearController = TextEditingController();
  var typeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomTextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'must be not empty!!';
                        } else {
                          return null;
                        }
                      },
                      radius: 10,
                      labelText: 'plateNumber',
                      hintText: 'EX:123اسي',
                      controller: plateNumberController,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomTextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'must be not empty!!';
                        } else {
                          return null;
                        }
                      },
                      radius: 10,
                      labelText: 'brand',
                      controller: brandController,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomTextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'must be not empty!!';
                        } else {
                          return null;
                        }
                      },
                      radius: 10,
                      labelText: 'model',
                      controller: modelController,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomTextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'must be not empty!!';
                        } else {
                          return null;
                        }
                      },
                      radius: 10,
                      labelText: 'year',
                      controller: yearController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomTextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'must be not empty!!';
                        } else {
                          return null;
                        }
                      },
                      radius: 10,
                      labelText: 'type',
                      hintText: 'Truck, Pickup, Van',
                      controller: typeController,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocListener<AddTruckCubit, AddTruckState>(
                    listener: (context, state) {
                      if (state is AddTruckLoading) {
                        Fluttertoast.showToast(
                          msg: 'Loading.',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      } else if (state is AddTruckSuccess) {
                        Fluttertoast.showToast(
                          msg: 'Truck Added Successfuly.',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      } else if (state is AddTruckFailure) {
                        Fluttertoast.showToast(
                          msg: 'Error!.',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() == true) {
                                context.read<AddTruckCubit>().addTruck(user, {
                                  "plateNumber":
                                      plateNumberController.text.toString(),
                                  "brand": brandController.text.toString(),
                                  "model": modelController.text.toString(),
                                  "year": yearController.text.toString(),
                                  "type": typeController.text.toString()
                                });
                                setState(() {
                                  plateNumberController.clear();
                                  brandController.clear();
                                  modelController.clear();
                                  yearController.clear();
                                  typeController.clear();
                                });
                              }
                            },
                            text: 'Add Truck',
                            color: AppTheme.primarylight,
                            radius: 20,
                            height: 50,
                            width: 140,
                            fontsize: 14,
                            textColor: AppTheme.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
