import 'package:e_commerce_app/logic/controllers/card_controller.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class AddCard extends StatelessWidget {
  final double price ;
  ProductModel productModel;

   AddCard({
     required this.price,
     required this.productModel,
     Key? key
   }) : super(key: key);

  final controller = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                text: 'Price',
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
              Text(
                '\$ $price',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black ,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Get.isDarkMode ? pinkClr :mainColor ,
                ),
                onPressed: (){
                  controller.addProductToCard(productModel);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Add to Card',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.shopping_cart)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
