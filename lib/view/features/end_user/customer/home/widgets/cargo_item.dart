import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';

class CargoItem extends StatelessWidget {
  const CargoItem({super.key, this.filePath});
  final String? filePath;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.lightGrey,
      elevation: 5, // Adjust the elevation to give a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Rounded corners
      ),
      child: filePath == null
          ? const SizedBox(
              width: 50,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors
                      .white, // Replace with AppTheme.white if you have it defined
                ),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.file(
                File(filePath!),
                fit: BoxFit.cover,
              )),
    );
  }
}
