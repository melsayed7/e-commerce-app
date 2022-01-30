import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/home/card_items.dart';
import 'package:e_commerce_app/view/widgets/auth/home/search_form.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor ,
          body: Column(
            children:
            [
              Container(
                width: double.infinity,
                height: 200,
                decoration:  BoxDecoration(
                  color: Get.isDarkMode ? darkGreyClr : mainColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                     [
                       const TextUtils(
                        text: 'Find Your',
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                       const SizedBox(height: 5,),
                       const TextUtils(
                        text: 'INSPIRATION',
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                      const SizedBox(height: 25,),
                      SearchTextForm(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
               Padding(
                padding:const EdgeInsets.only(left:15 ),
                child:  Align(
                  alignment: Alignment.centerLeft ,
                  child:  TextUtils(
                      text: 'Categories',
                      color: Get.isDarkMode ? Colors.white :Colors.black ,
                      fontSize: 25 ,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              CardItems(),

            ],
          ),
        ),
    );
  }
}
