import 'package:e_commerce_app/logic/controllers/setting_controller.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SettingController>(
      builder: (controller) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconMode(),
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(vertical: 2 , horizontal:6 ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              width: 2,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 20,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  child: Text(
                    english,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value:ene ,
                ),
                DropdownMenuItem(
                  child: Text(
                    arabic,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value:ara ,
                ),
                DropdownMenuItem(
                  child: Text(
                    france,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value:frf ,
                ),
              ],
              value: controller.langLocal,
              onChanged: (value) {
                controller.changeLanguage(value!);
                Get.updateLocale(Locale(value));
                },
            ),
          ),
        ),
      ],
    ),
    );
  }
  Widget buildIconMode() =>  Material(
    color: Colors.transparent,
    child: Row(
      children:  [
        const CircleAvatar(
          backgroundColor: languageSettings,
          child: Icon(
            Icons.language,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10,),
        TextUtils(
          text: 'Language'.tr,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
      ],
    ),
  );
}
