import 'package:e_commerce_app/logic/controllers/main_controller.dart';
import 'package:e_commerce_app/logic/controllers/payment_controller.dart';
import 'package:e_commerce_app/logic/controllers/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PaymentController(),permanent: true);
  }

}