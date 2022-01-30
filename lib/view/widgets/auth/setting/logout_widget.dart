import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {
   LogoutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (controller) => Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              Get.defaultDialog(
                title: 'Logout !!',
                titleStyle: const TextStyle(
                  fontSize: 25 ,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                middleText: 'Are you need to logout ?',
                middleTextStyle: const TextStyle(
                  fontSize: 20 ,
                  color: Colors.black,
                ),
                radius: 8,
                textCancel: 'No',
                cancelTextColor: Colors.black,
                onCancel: (){Get.back();},
                textConfirm: 'Yes',
                confirmTextColor: Colors.black ,
                onConfirm: (){controller.signOut();},
                backgroundColor: Get.isDarkMode ? pinkClr : mainColor ,
              );
            },
            splashColor: Get.isDarkMode ?  pinkClr.withOpacity(.4) :mainColor.withOpacity(.4),
            borderRadius: BorderRadius.circular(12),
            customBorder: const StadiumBorder(),
            child: Row(
              children:  [
                const CircleAvatar(
                  backgroundColor: logOutSettings,
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10,),
                TextUtils(
                  text: 'Log Out'.tr,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ],
            ),
          ),
        ),
    );
  }
}
