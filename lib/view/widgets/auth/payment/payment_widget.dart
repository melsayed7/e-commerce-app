import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {

  int currentRadioIndex = 1 ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        buildPaymentRadio(
          image: 'assets/images/paypal.png',
          scale: .7,
          title: 'PayPal',
          value: 1,
          onChange: (value){
            setState(() {
              currentRadioIndex = value;
            });
          },
        ),
        const SizedBox(height: 15,),
        buildPaymentRadio(
          image: 'assets/images/google.png',
          scale: .8,
          title: 'Google Pay',
          value: 2,
          onChange: (value){
            setState(() {
              currentRadioIndex = value;
            });
          },
        ),
        const SizedBox(height: 15,),
        buildPaymentRadio(
          image: 'assets/images/credit.png',
          scale: .8,
          title: 'Credit Card',
          value: 3,
          onChange: (value){
            setState(() {
              currentRadioIndex = value;
            });
          },
        ),
      ],
    );
  }
  Widget buildPaymentRadio({
    required String image,
    required double scale,
    required String title,
    required int value,
    required Function onChange,
}) => Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
      [
        Row(
          children:
          [
            Image.asset( image , scale: scale,),
            const SizedBox(width: 8,),
            TextUtils(
              text: title,
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ],
        ),
        Radio(
            value: value,
            groupValue: currentRadioIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Get.isDarkMode ? pinkClr : mainColor),
            onChanged: (value) {
              onChange(value);
            },
        ),
      ],

    ),
  );
}
