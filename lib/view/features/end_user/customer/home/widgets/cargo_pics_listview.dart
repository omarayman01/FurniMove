import 'package:flutter/material.dart';
import 'package:furni_move/view/features/end_user/customer/home/widgets/cargo_item.dart';

class CargoPicsListView extends StatefulWidget {
  const CargoPicsListView({super.key});

  @override
  State<CargoPicsListView> createState() => _CargoPicsListViewState();
}

class _CargoPicsListViewState extends State<CargoPicsListView> {
  List<CargoItem> cargoItems = [
    const CargoItem()
  ]; // Maintain the list of cargo items in the state

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cargoItems.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: screenWidth * 0.19,
          height: screenHeight * 0.1,
          child: InkWell(
            child: cargoItems[index],
            onTap: () {
              setState(() {
                cargoItems
                    .add(const CargoItem()); // Add a new CargoItem to the list
              });
            },
          ),
        );
      },
    );
  }
}
