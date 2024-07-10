import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/core/custom_widgets/edit_credentials.dart';
import 'package:furni_move/view/core/custom_widgets/edit_photo.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              SizedBox(height: screenHeight * 0.02),
              const EditPhoto(),
              SizedBox(height: screenHeight * 0.05),
              const EditCredentials(),
            ],
          ),
        ),
      ),
    );
  }
}
