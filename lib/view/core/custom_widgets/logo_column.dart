import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/assets.dart';

class LogoColumn extends StatelessWidget {
  const LogoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              color: AppTheme.dividerblack,
            ),
          ),
          Image(
            image: AssetImage(MyAssets.logo),
            width: 150,
            height: 80,
          ),
          Expanded(
            child: Divider(
              thickness: 2,
              color: AppTheme.dividerblack,
            ),
          ),
        ],
      ),
    );
  }
}
