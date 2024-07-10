import 'package:flutter/material.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.offer});
  final OfferModel offer;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      color: AppTheme.white,
      elevation: 10, // Shadow depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(
                  url: offer.serviceProvider!.userImgUrl,
                  backColor: AppTheme.primarylight,
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.15,
                ),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Text(
                  offer.serviceProvider!.userName!,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'Email: ',
                //   style: Theme.of(context).textTheme.bodyMedium,
                // ),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: Center(
                    child: Text(
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      offer.serviceProvider!.email!.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'Phone: ',
                //   style: Theme.of(context).textTheme.bodyMedium,
                // ),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: Center(
                    child: Text(
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      offer.serviceProvider!.phoneNumber!.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${offer.price!.toString()} \$',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // Text(
                //   '29/6/2024',
                //   style: Theme.of(context).textTheme.bodyMedium,
                // )
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
