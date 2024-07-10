import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class ConfirmationBottomSheet extends StatefulWidget {
  const ConfirmationBottomSheet(
      {super.key,
      required this.hintText,
      required this.radius,
      required this.text,
      this.token,
      this.verified});
  final String hintText;
  final String text;
  final String? token;
  final bool? verified;

  final double radius;
  @override
  State<ConfirmationBottomSheet> createState() =>
      _ConfirmationBottomSheetState();
}

class _ConfirmationBottomSheetState extends State<ConfirmationBottomSheet> {
  var emailController = TextEditingController();
  // var codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.blackText, fontSize: 24),
              ),
            ),
          ),
          // CustomTextFormField(
          //     controller: emailController,
          //     hintText: widget.hintText,
          //     radius: widget.radius),
          // CustomButton(
          //     text: 'Press to send Code',
          //     color: AppTheme.primarylight,
          //     radius: 5,
          //     height: 50,
          //     width: 200),
          const SizedBox(height: 50),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 24),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       'Enter Code',
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodyLarge!
          //           .copyWith(color: AppTheme.blackText),
          //     ),
          //   ),
          // ),
          // CustomTextFormField(
          //     controller: codeController, hintText: '', radius: widget.radius),
          widget.verified!
              ? CustomButton(
                  textColor: AppTheme.white,
                  onPressed: () {
                    // confirmEmail(widget.token!);
                  },
                  text: 'Email Sent',
                  color: AppTheme.red,
                  radius: 5,
                  height: 70,
                  width: 250)
              : CustomButton(
                  textColor: AppTheme.white,
                  onPressed: () {
                    confirmEmail(widget.token!);
                  },
                  text: 'Send Verification Email',
                  color: AppTheme.primarylight,
                  radius: 5,
                  height: 70,
                  width: 250)
        ],
      ),
    );
  }

  Future<void> confirmEmail(String token) async {
    // if (formKey.currentState?.validate() == true) {
    Response response = await DioHelper.postData(
        endPoint: EndPoints.confirmEmail, token: token);
    debugPrint('Confimmm page!!!!');
    Map<String, dynamic> data = response.data;
    debugPrint(data.toString());
    // user = UserModel.fromJson(data);
  }
}
