import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/data.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/registration/widgets/register_option.dart';
import 'package:furni_move/view_model/cubits/account_cubits/signup/signup_cubit.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  late UserModel user;
  bool isVisiblePassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const LogoColumn(),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.welcomeRoute);
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 20),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('Sign Up',
                          style: Theme.of(context).textTheme.displayMedium)),
                ),
                Text('Create your own account',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppTheme.grey)),
                const SizedBox(height: 1),
                CustomTextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'UserName must be not empty!!';
                      } else if (!RegExp(validationName)
                          .hasMatch(value.trim())) {
                        return 'UserName is not valid!';
                      } else {
                        return null;
                      }
                    },
                    controller: userNameController,
                    labelText: 'UserName',
                    radius: 8),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Email must be not empty!!';
                    } else if (!RegExp(validationEmail)
                        .hasMatch(value.trim())) {
                      return 'Email is not valid!';
                    } else {
                      return null;
                    }
                  },
                  labelText: 'E-mail',
                  radius: 8,
                  controller: emailController,
                ),
                CustomTextFormField(
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
                  labelText: 'Password',
                  radius: 8,
                  controller: passwordController,
                ),
                CustomTextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Phone Number must be not empty!!';
                      } else if (!RegExp(validationPhone)
                          .hasMatch(value.trim())) {
                        return 'Phone Number is not valid!';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    labelText: 'PhoneNumber',
                    radius: 8),
                const SizedBox(height: 5),
                BlocListener<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      Navigator.pushReplacementNamed(context, Routes.loginRoute,
                          arguments: args);
                    } else if (state is SignupLoading) {
                      Fluttertoast.showToast(
                        msg: '.........',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                  child: CustomButton(
                      textColor: AppTheme.white,
                      text: 'Sign Up',
                      color: AppTheme.primarylight,
                      radius: 6,
                      height: 50,
                      width: 220,
                      onPressed: () async {
                        await signUp(args);
                      }),
                ),
                const SizedBox(height: 5),
                RegisterOption(
                    txt1: 'Already a member?  ',
                    txt2: 'Log In',
                    onTap: () => Navigator.pushReplacementNamed(
                        context, Routes.loginRoute,
                        arguments: args)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp(String args) async {
    if (formKey.currentState?.validate() == true) {
      await context.read<SignupCubit>().customerSignup({
        'password': passwordController.text,
        'Email': emailController.text,
        'username': userNameController.text,
        'phoneNumber': phoneController.text,
        'role': args
      });
    }
    setState(() {});
  }
}
