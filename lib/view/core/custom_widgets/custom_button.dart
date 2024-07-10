import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.onPressed,
    required this.radius,
    required this.height,
    required this.width,
    this.fontsize = 18,
    required this.textColor,
    this.borderColor,
  });
  final double radius, height, width;
  final String text;
  final Color color, textColor;
  final Color? borderColor;

  final double? fontsize;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: SizedBox(
        height: height,
        width: width,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide.none, // Border color
            ),
            backgroundColor: color,
          ),
          child: Center(
              child: Text(text,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: textColor, fontSize: fontsize))),
        ),
      ),
    );
  }
}
