import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/views/item_details_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/widgets/item_pic.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/get_appliances/get_appliances_cubit.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<GetAppliancesCubit, GetAppliancesState>(
      builder: (context, state) {
        if (state is GetAppliancesSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.appliances.length,
            itemBuilder: (context, index) {
              return SizedBox(
                  width: screenWidth * 0.33,
                  height: screenHeight * 0.2,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemDetailsScreen(
                                    appliance: state.appliances[index],
                                  )),
                        );
                      },
                      child: ItemPic(appliance: state.appliances[index])));
            },
          );
        } else if (state is GetAppliancesFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
