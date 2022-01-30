import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/setting/dark_mode_widget.dart';
import 'package:e_commerce_app/view/widgets/auth/setting/language_widget.dart';
import 'package:e_commerce_app/view/widgets/auth/setting/logout_widget.dart';
import 'package:e_commerce_app/view/widgets/auth/setting/profile_image.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(25),
        children:
        [
          ProfileImage(),
          const SizedBox(height: 10,),
          Divider(
            color: Get.isDarkMode ?  Colors.white : Colors.grey,
            thickness: 4,
          ),
          const SizedBox(height: 20,),
          TextUtils(
            text: 'General'.tr,
            color: Get.isDarkMode ?  pinkClr  : mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
          const SizedBox(height: 20,),
          DarkModeWidget(),
          const SizedBox(height: 20,),
          LanguageWidget(),
          const SizedBox(height: 20,),
          LogoutWidget(),
        ],
      ),
    );
  }
}
