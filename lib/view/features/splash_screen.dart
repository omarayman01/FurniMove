import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/assets.dart';
import 'package:furni_move/view/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(MyAssets.logo),
            SizedBox(height: screenHeight * 0.12),
            SizedBox(
              height: screenHeight * 0.65,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    left: isAnimate ? screenWidth * 0.15 : -0,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 4),
                    onEnd: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                    },
                    child: Image.asset(
                      MyAssets.logo,
                      width: screenHeight * 0.34,
                      height: screenHeight * 0.3,
                    ),
                  ),
                  AnimatedPositioned(
                      bottom: isAnimate ? screenHeight * 0.18 : 0,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 4),
                      onEnd: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                      child: Text(
                        'FurniMove',
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
