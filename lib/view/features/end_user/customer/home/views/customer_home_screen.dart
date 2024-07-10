// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/customer/home/widgets/cargo_item.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/add_applaince/add_appliance_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/create_location/create_location_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/create_location2/create_location2_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/create_move_request/create_move_request_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key, required this.user});
  final UserModel user;
  static const List<String> vehicles = ['Pickup', 'Van', 'Truck'];

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  String? selectedVehicle = CustomerHomeScreen.vehicles.first;
  dynamic selectedDate = DateTime.now();
  dynamic dateFormate = DateFormat('yyyy/MM/dd');

  LatLng? sourceMarker;
  LatLng? destinationMarker;
  int? destinationID;
  int? sourceID;
  int? moveId;

  var applianceController = TextEditingController();
  List<CargoItem> cargoItems = [const CargoItem()];
  List<FormData> formDataList = []; // Maintain the
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<CreateLocationCubit, CreateLocationState>(
        listener: (context, state) {
          if (state is CreateLocationSuccess) {
            sourceID = state.location.id;
            debugPrint('sourceID');
            debugPrint(sourceID.toString());
          }
        },
        child: BlocListener<CreateLocation2Cubit, CreateLocation2State>(
            listener: (context, state) {
              if (state is CreateLocation2Success) {
                destinationID = state.location.id;
                debugPrint('destinationID');
                debugPrint(destinationID.toString());
              }
            },
            child: BlocListener<CreateMoveRequestCubit, CreateMoveRequestState>(
                listener: (context, state) {
                  if (state is CreateMoveRequestSuccess) {
                    debugPrint(
                        'moveIdDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDd for ITEMSSSSSSSSSSSSSSSSSSSSSSSS');
                    moveId = state.response['id'];
                    debugPrint(moveId.toString());
                  }
                },
                child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.05),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: LogoColumn(),
                            ),
                            SizedBox(height: screenHeight * 0.05),
                            InkWell(
                              onTap: () async {
                                final dynamic result;
                                result = await Navigator.pushNamed(
                                  context,
                                  Routes.customerMapLocationRoute,
                                );
                                debugPrint('Firsttt BAck');

                                if (result != null && result is LatLng) {
                                  setState(() {
                                    sourceMarker = result;
                                  });
                                  debugPrint(sourceMarker.toString());
                                } else if (result == null) {}
                              },
                              child: Container(
                                width: screenWidth * 0.85,
                                height: screenHeight * 0.068,
                                decoration: BoxDecoration(
                                  color: AppTheme.lightGrey
                                      .withOpacity(0.15), // Divider color
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Pickup Location',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppTheme.blackText,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.05),
                                    if (sourceMarker != null)
                                      const Icon(Icons.verified)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            InkWell(
                              onTap: () async {
                                final dynamic result;
                                result = await Navigator.pushNamed(
                                  context,
                                  Routes.customerMapLocationRoute,
                                );
                                debugPrint('Firsttt BAck');

                                if (result != null && result is LatLng) {
                                  setState(() {
                                    destinationMarker = result;
                                  });
                                  debugPrint(destinationMarker.toString());
                                } else if (result == null) {}
                              },
                              child: Container(
                                width: screenWidth * 0.85,
                                height: screenHeight * 0.068,
                                decoration: BoxDecoration(
                                  color: AppTheme.lightGrey
                                      .withOpacity(0.15), // Divider color
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Destination',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppTheme.blackText,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.04),
                                    if (destinationMarker != null)
                                      const Icon(Icons.verified)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.03,
                                  height: screenHeight * 0.003,
                                  color: AppTheme.dividerGrey, // Divider color
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 20),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Vehicle Type',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                    )),
                                Container(
                                  width: screenWidth * 0.51,
                                  height: screenHeight * 0.003,
                                  color: AppTheme.dividerGrey, // Divider color
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Container(
                              width: screenWidth * 0.85,
                              height: screenHeight * 0.068,
                              decoration: BoxDecoration(
                                color: AppTheme.lightGrey
                                    .withOpacity(0.15), // Divider color
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(8),
                                  dropdownColor: AppTheme.white,
                                  value: selectedVehicle,
                                  items: CustomerHomeScreen.vehicles
                                      .map((vehicle) => DropdownMenuItem(
                                            value: vehicle,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                vehicle,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: AppTheme.blackText,
                                                    ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        selectedVehicle = value;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.03,
                                  height: screenHeight * 0.003,
                                  color: AppTheme.dividerGrey, // Divider color
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 20),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Number of appliances',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                    )),
                                Container(
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.003,
                                  color: AppTheme.dividerGrey, // Divider color
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.11,
                              child: CustomTextFormField(
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'must be not empty!!';
                                  } else {
                                    return null;
                                  }
                                },
                                radius: 8,
                                hintText: '0',
                                controller: applianceController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.03,
                                  height: screenHeight * 0.003,
                                  color: AppTheme.dividerGrey, // Divider color
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 20),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Pickup Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                    )),
                                Container(
                                  width: screenWidth * 0.51,
                                  height: screenHeight * 0.003,
                                  color: AppTheme.dividerGrey, // Divider color
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            InkWell(
                              onTap: () async {
                                dynamic selectedDate2;

                                selectedDate2 = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)),
                                    initialDate: selectedDate,
                                    initialEntryMode:
                                        DatePickerEntryMode.calendarOnly);

                                if (selectedDate2 != null) {
                                  selectedDate = selectedDate2;
                                }
                                setState(() {});
                              },
                              child: Container(
                                width: screenWidth * 0.85,
                                height: screenHeight * 0.068,
                                decoration: BoxDecoration(
                                  color: AppTheme.lightGrey
                                      .withOpacity(0.15), // Divider color
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: Text(
                                    dateFormate.format(selectedDate),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: AppTheme.blackText,
                                            fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.035,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.03,
                                  height: screenHeight * 0.003,
                                  color: AppTheme.dividerGrey, // Divider color
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 20),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Picture of your cargo',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                    )),
                                Container(
                                  width: screenWidth * 0.33,
                                  height: screenHeight * 0.003,
                                  color: AppTheme.dividerGrey, // Divider color
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.018,
                            ),
                            SizedBox(
                              height: screenHeight * 0.11,
                              width: screenWidth * 0.83,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cargoItems.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: screenWidth * 0.19,
                                    height: screenHeight * 0.1,
                                    child: InkWell(
                                      child: cargoItems[index],
                                      onTap: () async {
                                        dynamic img = await addPic();
                                        setState(() {
                                          cargoItems.add(CargoItem(
                                            filePath: img,
                                          ));
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            CustomButton(
                                onPressed: () async {
                                  if (formKey.currentState?.validate() ==
                                      true) {
                                    if (sourceMarker != null &&
                                        destinationMarker != null) {
                                      if (applianceController.text.toString() ==
                                              formDataList.length.toString() &&
                                          applianceController.text.toString() !=
                                              '0') {
                                        await getSourceId();
                                        await getDestinationId();
                                        await Future.delayed(
                                            const Duration(seconds: 4));
                                        await createMove();
                                        await Future.delayed(
                                            const Duration(seconds: 3));
                                        await addAppliances();
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: "Incorrect appliance number!",
                                          toastLength: Toast.LENGTH_LONG,
                                        );
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Both locations are required!",
                                        toastLength: Toast.LENGTH_LONG,
                                      );
                                    }
                                  }
                                },
                                fontsize: 15,
                                text: 'Create Request',
                                color: AppTheme.primarylight,
                                radius: 20,
                                height: screenHeight * 0.065,
                                width: screenWidth * 0.5,
                                textColor: AppTheme.white)
                          ],
                        ),
                      ),
                    ),
                  ),
                ))));
  }

  Future<String> addPic() async {
    late File img;
    var picker;
    picker = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (picker != null) {
      img = File(picker.path);
    }
    // String filename = img.toString().split('/').last;
    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromBytes(
        img.readAsBytesSync(),
        filename: img.path.split('/').last,
        contentType: MediaType('image', 'jpg'),
      ),
    });
    formDataList.add(formData);
    return img.path;
  }

  Future<void> getSourceId() async {
    context.read<CreateLocationCubit>().createLocation(user, {
      "latitude": '${sourceMarker!.latitude}',
      "longitude": '${sourceMarker!.longitude}'
    });
  }

  Future<void> getDestinationId() async {
    context.read<CreateLocation2Cubit>().createLocation2(user, {
      "latitude": '${destinationMarker!.latitude}',
      "longitude": '${destinationMarker!.longitude}'
    });
  }

  Future<void> createMove() async {
    // String date = "2024-07-05";
    debugPrint(user.userName.toString());
    debugPrint(sourceID.toString());
    debugPrint(destinationID.toString());
    debugPrint(applianceController.text.toString());
    debugPrint(selectedDate.toString().substring(0, 10).toString());
    debugPrint(selectedVehicle.toString());

    context.read<CreateMoveRequestCubit>().createMoveRequest(
      user,
      {
        "startLocationId": sourceID,
        "endLocationId": destinationID,
        "numOfAppliances": applianceController.text.toString(),
        "startDate": selectedDate.toString().substring(0, 10),
        "vehicleType": selectedVehicle!,
      },
      // {
      //   "startLocationId": 107,
      //   "endLocationId": 108,
      //   "numOfAppliances": 2,
      //   "startDate": "2024-07-05",
      //   "vehicleType": "Pickup",
      // },
    );
  }

  Future<void> addAppliances() async {
    debugPrint("IN ADDD APLLIANCE");
    debugPrint(moveId.toString());
    debugPrint(formDataList.length.toString());
    for (var i = 0; i < formDataList.length; i++) {
      await context
          .read<AddApplianceCubit>()
          .customerAddAppliance(user, moveId!, formDataList[i]);
      // await context
      //     .read<AddApplianceCubit>()
      //     .customerAddAppliance(
      //         user, 1!, formDataList[i]);
    }
    Fluttertoast.showToast(
      msg: "Move request created successfully.",
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
