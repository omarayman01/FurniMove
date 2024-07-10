import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption(
      {super.key, required this.txt1, required this.txt2, this.onTap});
  final String txt1, txt2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 0),

        Text('Or',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppTheme.lightGrey)),
        const SizedBox(height: 0),
        // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //   const SizedBox(width: 10),
        //   Avatar(
        //       height: 36,
        //       width: 36,
        //       backColor: AppTheme.white,
        //       url: 'http://pngimg.com/uploads/google/google_PNG19635.png'),
        //   const SizedBox(width: 20),
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.facebook,
        //         color: Colors.blue,
        //         size: 32,
        //       )),
        //   const SizedBox(width: 10),
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.apple,
        //         color: Colors.black,
        //         size: 32,
        //       ))
        // ]),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(txt1,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, color: AppTheme.lightGrey)),
            GestureDetector(
              onTap: onTap,
              child: Text(txt2,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      color: AppTheme.blackText,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }
}
