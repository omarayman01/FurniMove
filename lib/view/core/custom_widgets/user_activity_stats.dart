import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';

class UserActivityStats extends StatelessWidget {
  const UserActivityStats({super.key, required this.text, required this.num});
  final String text;
  final int num;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppTheme.grey),
        ),
        Text(
          num.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppTheme.blackText),
        ),
      ],
    );
  }
}
