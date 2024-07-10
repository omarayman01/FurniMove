import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/customer/activity/views/customer_tracking_screen.dart';
import 'package:furni_move/view/features/end_user/customer/activity/widgets/customer_offers_listview.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/widgets/serviceprovider_offer.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/current_move/customer_current_move_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_get_offers/customer_get_offers_cubit.dart';

class CurrentRequestListView extends StatefulWidget {
  const CurrentRequestListView({super.key});

  @override
  State<CurrentRequestListView> createState() => _CurrentRequestListViewState();
}

class _CurrentRequestListViewState extends State<CurrentRequestListView> {
  @override
  void initState() {
    context.read<CustomerCurrentMoveCubit>().fetchCustomerCurrentMove(user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCurrentMoveCubit, CustomerCurrentMoveState>(
      builder: (context, state) {
        if (state is CustomerCurrentMoveSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  print(state.request.status);
                  if (state.request.status == "Ongoing") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerTrackingScreen(
                            request: state.request,
                          ),
                        )).then((value) => {
                          if (value == true) {setState(() {})}
                        });
                  } else if (state.request.status == "Waiting") {
                    showModalBottomSheet(
                        enableDrag: true,
                        elevation: 10,
                        backgroundColor: Colors.white.withOpacity(0.8),
                        context: context,
                        builder: (_) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
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
                            )).whenComplete(() {
                      setState(() {
                        context
                            .read<CustomerCurrentMoveCubit>()
                            .fetchCustomerCurrentMove(user);
                      });
                    });
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                    const Expanded(
                                        child: CustomerOffersListView())
                                  ],
                                ),
                              ),
                            )).then((value) => {
                          if (value == null || value || value != null)
                            {
                              setState(() {
                                print('setState called');
                                context
                                    .read<CustomerCurrentMoveCubit>()
                                    .fetchCustomerCurrentMove(user);
                              })
                            }
                        });
                  }
                },
                child: MoveCard(
                  request: state.request,
                  map: true,
                  customer: true,
                ),
              );
            },
            itemCount: 1,
          );
        } else if (state is CustomerCurrentMoveFailure) {
          return const Center(child: Text(''));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
