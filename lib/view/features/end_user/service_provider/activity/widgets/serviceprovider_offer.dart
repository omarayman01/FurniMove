import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/customer/activity/views/customer_tracking_screen.dart';
import 'package:furni_move/view/features/end_user/customer/activity/widgets/customer_offers_listview.dart';
import 'package:furni_move/view/features/end_user/customer/activity/widgets/rate_form.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/request_map_screen.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_get_offers/customer_get_offers_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/current_move/current_move_cubit.dart';

class MoveCard extends StatelessWidget {
  const MoveCard(
      {super.key,
      this.rate,
      required this.request,
      this.map,
      this.customer,
      this.doRate});
  final bool? rate;
  final bool? doRate;

  final bool? map;
  final bool? customer;

  final RequestModel request;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () async {
          if (doRate != null && request.rating == null) {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      backgroundColor: Colors.transparent,
                      child: RateFrom(
                        moveId: request.id!,
                      ));
                });
          }
          if (rate == null && map == true) {
            if (customer == null) {
              // await context.read<CurrentMoveCubit>().fetchCurrentMove(user);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RequestMapScreen(
                      request: request,
                    ),
                  ));
            } else {
              if (request.status == "Ongoing") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerTrackingScreen(
                        request: request,
                      ),
                    ));
              } else if (request.status == "Waiting") {
                showModalBottomSheet(
                    enableDrag: true,
                    elevation: 10,
                    backgroundColor: Colors.white.withOpacity(0.8),
                    context: context,
                    builder: (_) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'Waiting for service provider to ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 18),
                                  ),
                                ),
                                Center(
                                  child: Text('start the ride.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 18)),
                                ),
                              ],
                            ),
                          ),
                        ));
              } else {
                context
                    .read<CustomerGetOffersCubit>()
                    .fetchCustomerOffers(user);
                showModalBottomSheet(
                    enableDrag: true,
                    elevation: 10,
                    backgroundColor: Colors.white.withOpacity(0.8),
                    context: context,
                    builder: (_) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 1,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Column(
                              children: [
                                Text(
                                  'Offers',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(fontSize: 24),
                                ),
                                const Expanded(child: CustomerOffersListView())
                              ],
                            ),
                          ),
                        ));
              }
            }
          }
        },
        child: Card(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Avatar(
                      url: request.customer!.userImgUrl,
                      backColor: AppTheme.primarylight,
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.15,
                    ),
                    Text(
                      request.customer!.userName!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: Text(
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        request.startAddress!.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'End: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: Text(
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        request.endAddress!.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      request.startDate!.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    // Text(
                    //   '29/6/2024',
                    //   style: Theme.of(context).textTheme.bodyMedium,
                    // )
                  ],
                ),
                const SizedBox(height: 10),
                rate != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${request.cost.toString()} \$',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                request.rating.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                              '${request.cost.toString()} \$',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
