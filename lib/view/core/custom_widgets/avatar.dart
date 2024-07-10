import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';

class Avatar extends StatelessWidget {
  final double height, width;
  final String? url;
  final Color backColor;

  const Avatar(
      {super.key,
      this.height = 72,
      this.width = 72,
      required this.backColor,
      this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backColor,
      ),
      child: url == null
          ? ClipOval(
              child: Icon(
              Icons.person,
              color: AppTheme.white,
              size: 40,
            ))
          : ClipOval(child: Image.network(url!, fit: BoxFit.cover)),
    );
  }
}
