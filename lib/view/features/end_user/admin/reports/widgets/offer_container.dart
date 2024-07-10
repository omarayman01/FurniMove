import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/modal_bottomsheet_offers.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/current_move/customer_current_move_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_accept_move_offer/customer_accept_move_offer_cubit.dart';

class OfferContainer extends StatelessWidget {
  const OfferContainer(
      {super.key, required this.offer, this.color, this.isCustomer});
  final OfferModel offer;
  final Color? color;
  final bool? isCustomer;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.15,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color ?? AppTheme.lightGrey.withOpacity(0.3),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Avatar(
            url: offer.serviceProvider!.userImgUrl,
            backColor: AppTheme.primarylight,
            height: screenHeight * 0.09,
            width: screenWidth * 0.18,
          ),
          SizedBox(width: screenWidth * 0.03),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.003),
              Text(
                offer.serviceProvider!.userName.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 15),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                offer.serviceProvider!.phoneNumber.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppTheme.grey, fontSize: 15),
              ),
              if (isCustomer == null)
                Row(
                  children: [
                    Text(
                      'Accepted: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15),
                    ),
                    Text(
                      offer.accepted.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15),
                    )
                  ],
                )
            ],
          ),
          SizedBox(width: screenWidth * 0.05),
          if (isCustomer != null)
            CustomButton(
              onPressed: () async {
                await context
                    .read<CustomerAcceptMoveOfferCubit>()
                    .customerAcceptMoveOffer(user, offer.id!);
                await context
                    .read<CustomerCurrentMoveCubit>()
                    .fetchCustomerCurrentMove(user);
                Navigator.pop(context, true);
              },
              text: 'Accept',
              fontsize: screenHeight * 0.016,
              color: AppTheme.green,
              radius: 5,
              height: screenHeight * 0.05,
              width: screenWidth * 0.18,
              textColor: AppTheme.blackText,
            ),
          const Spacer(),
          Row(
            children: [
              // const Icon(Icons.star, color: Colors.yellow),
              Text(
                '${offer.price.toString()}\$',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
