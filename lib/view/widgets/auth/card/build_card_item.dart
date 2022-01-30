import 'package:e_commerce_app/logic/controllers/card_controller.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class buildCardItem extends StatelessWidget {

  final ProductModel productModel;
  final int index;
  final int count;
   buildCardItem({
     required this.productModel,
     required this.index,
     required this.count,
     Key? key,
  }) : super(key: key);

  final controller = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(.4)
            : mainColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 15,
            ),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(productModel.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\$ ${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFromCard(productModel);
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                  TextUtils(
                    text: "$count",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCard(productModel);
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModel);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.white : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
