import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class ConfirmationPasswordBottomSheet extends StatefulWidget {
  const ConfirmationPasswordBottomSheet(
      {super.key,
      required this.hintText,
      required this.radius,
      required this.text});
  final String hintText;
  final String text;

  final double radius;
  @override
  State<ConfirmationPasswordBottomSheet> createState() =>
      _ConfirmationPasswordBottomSheetState();
}

class _ConfirmationPasswordBottomSheetState
    extends State<ConfirmationPasswordBottomSheet> {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.blackText),
              ),
            ),
          ),
          CustomTextFormField(
              controller: oldPasswordController,
              hintText: 'old password',
              radius: widget.radius),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'New Password',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.blackText),
              ),
            ),
          ),
          CustomTextFormField(
              controller: newPasswordController,
              hintText: 'New Password',
              radius: widget.radius),
          CustomTextFormField(
              controller: confirmController,
              hintText: 'Confirm Password',
              radius: widget.radius),
          CustomButton(
              textColor: AppTheme.white,
              onPressed: () {
                confirmPassword(newPasswordController.text,
                    oldPasswordController.text, user.token!);
              },
              text: 'Change',
              color: AppTheme.primarylight,
              radius: 5,
              height: 50,
              width: 130)
        ],
      ),
    );
  }

  Future<void> confirmPassword(
      String newPassword, String oldPassword, String token) async {
    print(token);
    // if (formKey.currentState?.validate() == true) {
    Response response = await DioHelper.patchData(
        token: token,
        endPoint: EndPoints.resetPaswword,
        data: {"currentPassword": oldPassword, "newPassword": newPassword});
    debugPrint('password page!!!!');
    Map<String, dynamic> data = response.data;
    debugPrint(data.toString());
    // user = UserModel.fromJson(data);
  }
}
