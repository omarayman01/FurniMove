import 'package:flutter/material.dart';

class ContainerChoice extends StatelessWidget {
  const ContainerChoice(
      {super.key,
      required this.img,
      required this.txt1,
      required this.txt2,
      required this.containerColor});
  final String img, txt1, txt2;
  final Color containerColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: containerColor),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage(img), width: 100, height: 100),
            Column(
              children: [
                Center(
                  child: Text(
                    txt1,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  txt2,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
