import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  _SizeListState createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> selectedSizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => buildSizeList(index),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        itemCount: selectedSizeList.length,
      ),
    );
  }

  Widget buildSizeList(int index) => InkWell(
        onTap: () {
          setState(() {
            currentSelected = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? currentSelected == index
                    ? pinkClr.withOpacity(.7)
                    : Colors.black
                : currentSelected == index
                    ? mainColor.withOpacity(.4)
                    : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.withOpacity(.4),
              width: 2,
            ),
          ),
          child: TextUtils(
            text: selectedSizeList[index],
            color: Get.isDarkMode ? currentSelected == index ? Colors.white : Colors.white : currentSelected == index ? Colors.black : Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      );
}
