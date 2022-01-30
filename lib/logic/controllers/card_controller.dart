import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  var productMap = {}.obs;
  ProductModel? productModel;

  void addProductToCard(productModel) {
    if (productMap.containsKey(productModel)) {
      productMap[productModel] += 1;
    } else {
      productMap[productModel] = 1;
      /*Get.snackbar(
        'Add Product to Card',
        productMap[productModel],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );*/
    }
  }

  void removeProductsFromCard(productModel) {
    if (productMap.containsKey(productModel) && productMap[productModel] == 1) {
      productMap.removeWhere((key, value) => key == productModel);
    } else {
      productMap[productModel] -= 1;
    }
  }

  void removeOneProduct(productModel) {
    productMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: 'Clear Products !!',
      titleStyle: const TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you need to remove all products ?',
      middleTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      radius: 8,
      textCancel: 'No',
      cancelTextColor: Colors.black,
      onCancel: () {
        Get.toNamed(Routes.cardScreen);
      },
      textConfirm: 'Yes',
      confirmTextColor: Colors.black,
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  int countCardItem() {

    if(productMap.isEmpty)
      {return 0 ;}
    else
      {
        return productMap.entries
            .map((e) => e.value)
            .toList()
            .reduce((value, element) => value + element);
      }

  }
}
