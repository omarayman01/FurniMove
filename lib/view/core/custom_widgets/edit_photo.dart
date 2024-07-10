import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/database/network/end_point.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class EditPhoto extends StatefulWidget {
  const EditPhoto({
    super.key,
  });

  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  late File file;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Avatar(
          backColor: AppTheme.primarylight,
          url: user.imgURL,
        ),
        SizedBox(width: screenWidth * 0.05),
        CustomButton(
            onPressed: () async {
              await uploadPhoto();
              await updateData();
            },
            fontsize: screenHeight * 0.015,
            text: 'Upload Photo',
            color: AppTheme.primarylight,
            radius: 10,
            height: screenHeight * 0.038,
            width: screenWidth * 0.3,
            textColor: AppTheme.white),
        const SizedBox(width: 20),
        CustomButton(
            onPressed: () async {
              await deletePhoto();
              await updateData();
            },
            borderColor: AppTheme.blackText.withOpacity(0.3),
            fontsize: screenHeight * 0.015,
            text: 'Delete Photo',
            color: AppTheme.white,
            radius: 8,
            height: screenHeight * 0.038,
            width: screenWidth * 0.3,
            textColor: AppTheme.blackText)
      ],
    );
  }

  Future<void> deletePhoto() async {
    print(user.imgURL.toString());
    print(user.token.toString());

    Response response = await DioHelper.deleteData(
      token: user.token,
      endPoint: EndPoints.deleteUserImg,
    );
    // debugPrint(response.toString());
    // debugPrint(response.data.toString());

    setState(() {});
  }

  Future<void> uploadPhoto() async {
    print(user.token);
    print('photooStart');
    late File img;
    var picker;
    picker = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (picker != null) {
      img = File(picker.path);
    }
    String filename = img.toString().split('/').last;
    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromBytes(
        img.readAsBytesSync(),
        filename: img.path.split('/').last,
        contentType: MediaType('image', 'jpg'),
      ),
    });
    debugPrint(filename);
    debugPrint(img.path);
    debugPrint(formData.toString());

    Response response = await DioHelper.postData(
      token: user.token,
      endPoint: EndPoints.addUserImg,
      imgData: formData,
    );
    debugPrint(response.data.toString());

    setState(() {});
  }

  Future<void> updateData() async {
    Response resp = await DioHelper.getData(
      endPoint: EndPoints.getUser,
      token: user.token,
    );
    debugPrint(resp.toString());
    debugPrint(resp.data.toString());
    UserModel user2;
    Map<String, dynamic> data = resp.data;
    debugPrint(data.toString());
    user2 = UserModel.fromJson(data);
    user.copyFrom(user2);
    print(user.imgURL.toString());
    print(user.token);
    setState(() {});
  }
}
