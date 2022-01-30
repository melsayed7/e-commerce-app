import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/payment/delivery_widget.dart';
import 'package:e_commerce_app/view/widgets/auth/payment/payment_widget.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              TextUtils(
                text: 'Shipping',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
              const SizedBox(height: 20,),
              const DeliveryWidget(),
              const SizedBox(height: 20,),
              TextUtils(
                text: 'Payment',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
              const SizedBox(height: 20,),
              const PaymentWidget(),
              const SizedBox(height: 20,),
              Center(
                child: TextUtils(
                  text: 'Total : \$500',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Get.isDarkMode ? pinkClr :mainColor ,
                  ),
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Pay Now',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.payment)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
