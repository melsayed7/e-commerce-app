import 'package:e_commerce_app/logic/controllers/setting_controller.dart';
import 'package:e_commerce_app/logic/controllers/theme_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconMode(),
        Switch(
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor ,
            value:controller.switchValue.value ,
            onChanged: (value) {
              ThemeController().changeTheme();
              controller.switchValue.value = value;
            }
        ),
      ],
    ));
  }

  Widget buildIconMode() =>  Material(
        color: Colors.transparent,
        child: Row(
          children:  [
            const CircleAvatar(
              backgroundColor: darkSettings,
                child: Icon(
                    Icons.dark_mode,
                  color: Colors.white,
                ),
            ),
            const SizedBox(width: 10,),
            TextUtils(
                text: 'Dark Mode'.tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
            ),
          ],
        ),
      );
}
