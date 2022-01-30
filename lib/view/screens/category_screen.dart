import 'package:e_commerce_app/view/widgets/auth/category/category_widget.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:  [
            Align(
               alignment: Alignment.centerLeft,
               child: TextUtils(
                text: 'Category',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
            ),
             ),
            const SizedBox(height: 15,),
            CategoryWidget()
          ],
        ),
      ),
    );
  }
}
