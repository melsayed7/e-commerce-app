import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_)
      {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: controller.isCheckBox
                    ? Icon(Icons.done , color:Get.isDarkMode ? pinkClr : mainColor,size: 30,)
                    : Container(),
              ),
            ),
            const SizedBox(width: 15,),
            Row(
              children:
              [
                TextUtils(
                  text: 'I accept ',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                //SizedBox(width: 15,),
                TextUtils(
                  text: 'terms & conditions ',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
