import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {

  String text ;
  Function()? onPressed ;
   AuthButton({
     required this.text,
     required this.onPressed,
     Key? key
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ?  pinkClr : mainColor,
        minimumSize: const Size(360, 50),
      ),
        onPressed: onPressed ,
        child:  TextUtils(
           text: text,
           color: Colors.white,
           fontSize: 30,
           fontWeight: FontWeight.normal,
           decoration: TextDecoration.none,
        ),
    );
  }
}
