import 'package:flutter/material.dart';
import 'package:furni_move/model/appliance.model.dart';
import 'package:furni_move/view/constants/app_theme.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.appliance});
  final ApplianceModel appliance;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appliance Details'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: screenHeight * 0.06,
          ),
          SizedBox(
            height: screenHeight * 0.4,
            width: screenWidth * 0.76,
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
          ),
          SizedBox(
            height: screenHeight * 0.06,
          ),
          SizedBox(
            width: screenWidth * 0.7,
            child: Center(
              child: Text(
                appliance.description!,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.06,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: SizedBox(
                height: screenHeight * 0.1,
                // width: screenWidth * 0.8,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appliance.tags!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppTheme.white,
                      elevation:
                          5, // Adjust the elevation to give a shadow effect
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                      child: SizedBox(
                        width: screenWidth * 0.25,
                        child: Center(
                          child: Text(
                            appliance.tags![index],
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: screenHeight * 0.026),
                          ),
                        ),
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
