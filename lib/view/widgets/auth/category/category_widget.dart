import 'package:e_commerce_app/logic/controllers/category_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/category/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({Key? key}) : super(key: key);

  final  controller = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading.value)
        {
          return  Center(
            child:  CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        }
      else
        {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.getCategoryIndex(index);
                    Get.to(() => CategoryItems(
                      categoryTitle: controller.categoryNameList[index],
                    ));
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image:  DecorationImage(
                        image: NetworkImage(
                          controller.categoryImage[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 15),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          controller.categoryNameList[index],
                          style: const TextStyle(
                            backgroundColor: Colors.black38,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: controller.categoryNameList.length,
            ),
          );
        }
    });
  }
}
