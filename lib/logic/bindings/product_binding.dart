import 'package:e_commerce_app/logic/controllers/card_controller.dart';
import 'package:e_commerce_app/logic/controllers/category_controller.dart';
import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings
{
  @override
  void dependencies() {
   Get.put(ProductController());
   Get.lazyPut(() => CardController());
   Get.put(CategoryController());
  }

}