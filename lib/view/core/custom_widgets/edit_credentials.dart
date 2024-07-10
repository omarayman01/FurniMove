import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/data.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/cubits/account_cubits/update/update_cubit.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class EditCredentials extends StatefulWidget {
  const EditCredentials({
    super.key,
  });

  @override
  State<EditCredentials> createState() => _EditCredentialsState();
}

class _EditCredentialsState extends State<EditCredentials> {
  var phoneController = TextEditingController();
  var newPasswordController = TextEditingController();
  var oldPasswordController = TextEditingController();
  bool isVisiblePassword = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full name',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppTheme.blackText,
                            fontWeight: FontWeight.w800)),
                    CustomButton(
                        fontsize: 13,
                        text: user.userName!,
                        color: AppTheme.white,
                        radius: 8,
                        height: screenHeight * 0.055,
                        width: screenWidth * 0.4,
                        textColor: AppTheme.blackText,
                        borderColor: AppTheme.blackText.withOpacity(0.5))
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppTheme.blackText,
                            fontWeight: FontWeight.w800)),
                    CustomButton(
                        fontsize: 13,
                        text: user.email!,
                        color: AppTheme.white,
                        radius: 8,
                        height: screenHeight * 0.055,
                        width: screenWidth * 0.4,
                        textColor: AppTheme.blackText,
                        borderColor: AppTheme.blackText.withOpacity(0.5))
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Role',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppTheme.blackText,
                            fontWeight: FontWeight.w800)),
                    CustomButton(
                        fontsize: 13,
                        text: user.role!,
                        color: AppTheme.white,
                        radius: 8,
                        height: screenHeight * 0.055,
                        width: screenWidth * 0.4,
                        textColor: AppTheme.blackText,
                        borderColor: AppTheme.blackText.withOpacity(0.5))
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('* Phone Number',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppTheme.blackText,
                            fontWeight: FontWeight.w800)),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.07,
                      child: CustomTextFormField(
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Phone number must be not empty!!';
                          } else if (!RegExp(validationPhone)
                              .hasMatch(value.trim())) {
                            return 'Phone number is not valid!';
                          } else {
                            return null;
                          }
                        },
                        hor: 0,
                        vert: 7,
                        controller: phoneController,
                        radius: 8,
                        hintText: user.phoneNumber,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: screenWidth * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('* Old Password',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.blackText,
                          fontWeight: FontWeight.w800)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      // width: 250,
                      height: screenHeight * 0.105,
                      child: CustomTextFormField(
                        isPassword: isVisiblePassword,
                        suffixIcon: isVisiblePassword
                            ? InkWell(
                                onTap: () {
                                  isVisiblePassword = !isVisiblePassword;
                                  setState(() {});
                                },
                                child: const Icon(Icons.visibility_off))
                            : InkWell(
                                onTap: () {
                                  isVisiblePassword = !isVisiblePassword;
                                  setState(() {});
                                },
                                child: const Icon(Icons.remove_red_eye)),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Password must be not empty!!';
                          } else if (!RegExp(validationPassword2)
                              .hasMatch(value.trim())) {
                            return 'Password is not valid!';
                          } else {
                            return null;
                          }
                        },
                        controller: oldPasswordController,
                        hor: 0,
                        vert: 15,
                        radius: 8,
                        hintText: '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: screenWidth * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('* New Password',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.blackText,
                          fontWeight: FontWeight.w800)),
                  SizedBox(
                    // width: 200,
                    height: screenHeight * 0.105,
                    child: CustomTextFormField(
                      isPassword: isVisiblePassword,
                      suffixIcon: isVisiblePassword
                          ? InkWell(
                              onTap: () {
                                isVisiblePassword = !isVisiblePassword;
                                setState(() {});
                              },
                              child: const Icon(Icons.visibility_off))
                          : InkWell(
                              onTap: () {
                                isVisiblePassword = !isVisiblePassword;
                                setState(() {});
                              },
                              child: const Icon(Icons.remove_red_eye)),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Password must be not empty!!';
                        } else if (!RegExp(validationPassword2)
                            .hasMatch(value.trim())) {
                          return 'Password is not valid!';
                        } else {
                          return null;
                        }
                      },
                      controller: newPasswordController,
                      hor: 0,
                      vert: 15,
                      radius: 8,
                      hintText: '',
                    ),
                  ),
                ],
              ),
            ),
            // const Spacer(),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    borderColor: AppTheme.blackText,
                    textColor: AppTheme.blackText,
                    onPressed: () => Navigator.pop(context, true),
                    text: 'Close',
                    color: AppTheme.white,
                    radius: 10,
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.4),
                SizedBox(width: screenWidth * 0.1),
                CustomButton(
                    textColor: AppTheme.white,
                    onPressed: () async {
                      if (formKey.currentState?.validate() == true) {
                        context.read<UpdateCubit>().customerUpdate(user, {
                          "phoneNumber": phoneController.text,
                          "oldPassword": oldPasswordController.text,
                          "password": newPasswordController.text
                        });
                        updateData();
                        Navigator.pop(context, true);
                      }
                    },
                    text: 'Save changes',
                    color: AppTheme.primarylight,
                    radius: 10,
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.4),
              ],
            ),
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  Future<void> updateProfile(String phoneNumber, String newPassword,
      String oldPassword, String token) async {
    print(phoneNumber);
    print(oldPassword);
    print(newPassword);

    // {
    //   "phoneNumber": phoneNumber,
    //   "oldPassword": oldPassword,
    //   "password": newPassword
    // }
  }

  Future<void> updateData() async {
    Response resp = await DioHelper.getData(
      endPoint: EndPoints.getUser,
      token: user.token,
    );
    debugPrint(resp.toString());
    debugPrint(resp.data.toString());
    UserModel user2;
    Map<String, dynamic> data = resp.data;
    debugPrint(data.toString());
    user2 = UserModel.fromJson(data);
    user.copyFrom(user2);
    print(user.imgURL.toString());
    print(user.token);
    setState(() {});
  }
}
