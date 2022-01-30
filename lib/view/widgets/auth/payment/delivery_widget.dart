import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/logic/controllers/payment_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  _DeliveryWidgetState createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {

  final paymentController = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();
  final TextEditingController phoneController = TextEditingController();
  int radioContainerIndex = 1 ;
  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          address: 'Al-Beheira , Damnhour , Touba Mosque',
          title: 'Clothes Shop',
          name: 'Mohamed Elsayed ',
          phone: '01061981944',
          icon: Container(),
          value: 1,
          color: changeColor ? Colors.white : Colors.grey.shade300,
          onChanged: (int value)
          {
            setState(() {
              radioContainerIndex = value;
              changeColor = !changeColor;
            });
          }
        ),
        const SizedBox(height: 15,),
        Obx((){
          return buildRadioContainer(
              address: paymentController.address.value,
              title: 'Delivery',
              name: authController.displayUserName.value,
              phone: paymentController.phoneNumber.value,
              icon: InkWell(
                onTap: (){
                  Get.defaultDialog(
                    title: 'PLZ Enter Your Phone Number',
                    titleStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.white,
                    textConfirm: ' Save ',
                    onConfirm: (){
                      Get.back();
                      paymentController.phoneNumber.value = phoneController.text;
                    },
                    confirmTextColor: Colors.black,
                    textCancel: ' Cancel ',
                    onCancel: (){Get.toNamed(Routes.paymentScreen);},
                    cancelTextColor: Colors.black,
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    content: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 11,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        onSubmitted: (value){
                          phoneController.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: (){phoneController.clear();},
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'PLZ Enter Your Phone Number',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  size: 25,
                ),
              ),
              value: 2,
              color: changeColor ?  Colors.grey.shade300 : Colors.white ,
              onChanged: (int value)
              {
                setState(() {
                  radioContainerIndex = value;
                  changeColor = !changeColor;
                });
                paymentController.updatePosition();
              }
          );
        }),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
}) => Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 5.0,
              spreadRadius: 3.0,
            ),
          ],
        ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Radio(
          onChanged: (int? value) { onChanged (value); },
          groupValue: radioContainerIndex,
          value: value,
          fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
        ),
        const SizedBox(width: 15,),
        Padding(
            padding: const EdgeInsets.only(top: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              TextUtils(
                text: title,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
              const SizedBox(height: 5,),
              TextUtils(
                text: name,
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  const Text('🇪🇬 +02',style: TextStyle(color: Colors.black),),
                  TextUtils(
                    text: phone,
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                  const SizedBox(width: 100,),
                  SizedBox(child: icon,),
                ],
              ),
              const SizedBox(height: 5,),
              TextUtils(
                text: address,
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ],
          ),
        ),
      ],
    ),
      );
}
