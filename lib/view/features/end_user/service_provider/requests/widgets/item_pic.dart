import 'package:flutter/material.dart';
import 'package:furni_move/model/appliance.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';

class ItemPic extends StatelessWidget {
  const ItemPic({super.key, required this.appliance});
  final ApplianceModel appliance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 90,
      child: Card(
        color: AppTheme.primarylight,
        elevation: 20, // Adjust the elevation to give a shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            appliance.imgUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
