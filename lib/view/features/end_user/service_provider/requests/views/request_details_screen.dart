import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/core/custom_widgets/custom_textformfield.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/widgets/items_listview.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/create_offer/create_offer_cubit.dart';

class RequestDetailsScreen extends StatefulWidget {
  const RequestDetailsScreen({super.key});

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  var priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    RequestModel request =
        ModalRoute.of(context)!.settings.arguments as RequestModel;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Request Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  // physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        Avatar(
                          url: request.customer!.userImgUrl,
                          backColor: AppTheme.primarylight,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          request.customer!.userName!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start: ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            softWrap: true,
                            request.startAddress!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'End: ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            softWrap: true,
                            request.endAddress!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Start Date:',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          request.startDate!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Vehicle Type :',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          request.vehicleType!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Time estimated: ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${request.eta}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Distance: ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          request.distance.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'End Time: ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${request.endTime}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Items:',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          request.numOfAppliances.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.08,
                    ),
                    SizedBox(
                      height: screenHeight * 0.22,
                      width: screenWidth * 0.9,
                      child: const ItemsListView(),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              BlocListener<CreateOfferCubit, CreateOfferState>(
                listener: (context, state) {
                  if (state is CreateOfferLoading) {
                    Fluttertoast.showToast(
                      msg: 'Loading.',
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  } else if (state is CreateOfferSuccess) {
                    Fluttertoast.showToast(
                      msg: 'Offer Done Successfuly.',
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  }
                },
                child: Center(
                  child: CustomButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  backgroundColor: Colors.white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: priceController,
                                        radius: 10,
                                        hintText: "Price",
                                      ),
                                      CustomButton(
                                          onPressed: () {
                                            context
                                                .read<CreateOfferCubit>()
                                                .createOffer(
                                              user,
                                              {
                                                "price": int.parse(
                                                    priceController.text),
                                                "moveRequestId": request.id!
                                              },
                                            );
                                            setState(() {
                                              priceController.clear();
                                            });
                                            Navigator.pop(context, true);
                                          },
                                          text: 'Send Offer',
                                          color: AppTheme.primarylight,
                                          radius: 25,
                                          height: 50,
                                          width: 150,
                                          textColor: AppTheme.white),
                                    ],
                                  ));
                            });
                      },
                      text: "Make Offer",
                      color: AppTheme.dividerGrey,
                      radius: 10,
                      height: 50,
                      width: 150,
                      textColor: AppTheme.blackText),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
