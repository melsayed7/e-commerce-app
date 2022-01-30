import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/logic/controllers/setting_controller.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
   ProfileImage({Key? key}) : super(key: key);

  final settingController = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row
      (
      children:
      [
        Container(
          height: 95,
          width: 95,
          decoration:  BoxDecoration(
            color: Colors.teal,
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(authController.displayUserPhoto.value)
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              TextUtils(
                text: settingController.capitalize(authController.displayUserName.value),
                color: Get.isDarkMode ?  Colors.white : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
              const SizedBox(height: 10,),
              TextUtils(
                text: authController.displayUserEmail.value,
                color: Get.isDarkMode ?  Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ],
          ),
        ),
      ],
    ),);
  }
}


