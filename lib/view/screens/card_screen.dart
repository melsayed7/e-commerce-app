import 'package:e_commerce_app/logic/controllers/card_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/card/build_card_item.dart';
import 'package:e_commerce_app/view/widgets/auth/card/card_total.dart';
import 'package:e_commerce_app/view/widgets/auth/card/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreen extends StatelessWidget {
   CardScreen({Key? key}) : super(key: key);

  final controller = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: const Text('Card Items'),
            backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
            elevation: 0.0,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: (){
                   controller.clearAllProducts();
                  },
                  icon: const Icon(
                      Icons.backspace,
                  ),
              ),
            ],
          ),
          body: Obx((){
             if(controller.productMap.isEmpty)
               {
                 return const EmptyCard();
               }else
                 {
                   return SingleChildScrollView(
                     physics: const BouncingScrollPhysics(),
                     child: Column(
                       children:
                       [
                         SizedBox(
                           height:500,
                           child: ListView.separated(
                             itemBuilder: (context, index) => buildCardItem(
                               productModel: controller.productMap.keys.toList()[index],
                               index: index,
                               count: controller.productMap.values.toList()[index],
                             ),
                             separatorBuilder:(context, index) =>  const SizedBox(height: 5,),
                             itemCount: controller.productMap.length,
                           ),
                         ),
                         CardTotal(),
                       ],
                     ),
                   );
                 }
          }),
        ),
    );

  }
}
