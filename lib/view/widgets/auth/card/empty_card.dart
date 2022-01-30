import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Icon(
            Icons.shopping_cart_rounded,
            size: 200,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(height: 20,),
          RichText(
              text: TextSpan(
                children:
                [
                  TextSpan(
                    text: 'Your Card is ',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Empty ',
                    style: TextStyle(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ),
          ),
          const SizedBox(height: 10,),
          TextUtils(
              text: 'Add item to get Started',
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
          ),
          const SizedBox(height: 40,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Get.isDarkMode ? pinkClr :mainColor ,
            ),
              onPressed: (){Get.toNamed(Routes.mainScreen);},
              child: const Text(
                'Go to Home',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
          ),
        ],
      ),
    );
  }
}
