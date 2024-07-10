import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';

import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/registration/widgets/container_choice.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAnimate = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isAnimate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          const LogoColumn(),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          const SizedBox(height: 10),
          Text('How do you want to use furni_Move today?',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 60),
          SizedBox(
            height: 130,
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: isAnimate ? 35 : 0,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 2),
                  onEnd: () {},
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, Routes.signUpRoute,
                        arguments: 'Customer'),
                    child: ContainerChoice(
                        img: 'assets/images/moving_client.png',
                        txt1: 'As client',
                        txt2: 'to get tasks done',
                        containerColor: AppTheme.primarylight),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130,
            child: Stack(
              children: [
                AnimatedPositioned(
                  right: isAnimate ? 35 : 0,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 2),
                  onEnd: () {},
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, Routes.signUpRoute,
                        arguments: 'ServiceProvider'),
                    child: ContainerChoice(
                        img: 'assets/images/delivery-boy.png',
                        txt1: 'As service provider',
                        txt2: 'assisting with tasks',
                        containerColor: AppTheme.primarylight.withOpacity(0.8)),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 130,
          //   child: Stack(
          //     children: [
          //       AnimatedPositioned(
          //         left: isAnimate ? 35 : 0,
          //         curve: Curves.fastOutSlowIn,
          //         duration: const Duration(seconds: 2),
          //         onEnd: () {},
          //         child: GestureDetector(
          //           onTap: () => Navigator.pushReplacementNamed(
          //               context, Routes.loginRoute,
          //               arguments: 'Admin'),
          //           child: ContainerChoice(
          //               img: 'assets/images/admin.png',
          //               txt1: 'As admin',
          //               txt2: 'Task coordination',
          //               containerColor: AppTheme.primarylight.withOpacity(0.6)),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
