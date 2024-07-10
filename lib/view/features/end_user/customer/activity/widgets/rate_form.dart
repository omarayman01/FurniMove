import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_history/customer_history_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/rate/rate_cubit.dart';

class RateFrom extends StatelessWidget {
  const RateFrom({super.key, required this.moveId});
  final int moveId;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight * 0.14,
        width: screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius:
              BorderRadius.circular(25.0), // Adjust the radius as needed
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () async {
                print(index + 1);
                await context
                    .read<RateCubit>()
                    .rateMove(user, moveId, (index + 1));
                // const Duration(seconds: 1);
                context.read<CustomerHistoryCubit>().fetchCustomerHistory(user);
                Navigator.pop(context);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: screenWidth *
                        0.14, // Adjust the size of the stars as needed
                  ),
                  Text(
                    '${index + 1}', // Display the star number (1-based index)
                    style: TextStyle(
                      color: AppTheme.primarylight,
                      fontSize:
                          screenWidth * 0.04, // Adjust the font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
