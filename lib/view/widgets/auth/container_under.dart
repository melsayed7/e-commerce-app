import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {

  String text;
  Function()? onPressed;
  String textBtn;
   ContainerUnder({
     required this.text,
     required this.textBtn,
     required this.onPressed,
     Key? key
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:  BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor ,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight:  Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          TextUtils(
              text: text,
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
          ),
          const SizedBox(width: 20,),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                text: textBtn,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline,
              ),
          ),
        ],
      ),
    );
  }
}
