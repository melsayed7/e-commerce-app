import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesScreen extends StatelessWidget {
   FavouritesScreen({Key? key}) : super(key: key);

  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,
     body: Obx(() {
       if(controller.favouriteList.isEmpty)
         {
           return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
               SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                     'assets/images/heart.png',
                   ),
                 ),
               const SizedBox(height: 20,),
               TextUtils(
                     text: 'Add some favourites !!',
                     color: Get.isDarkMode ? Colors.white : Colors.black,
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     decoration: TextDecoration.none,
                 ),
               ],
             ),
           );
         }else
           {
             return ListView.separated(
               physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildFavItem (
                  image: controller.favouriteList[index].image,
                  title: controller.favouriteList[index].title,
                  price: controller.favouriteList[index].rating.rate,
                  productId: controller.favouriteList[index].id,
                ),
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                itemCount: controller.favouriteList.length,
            );
                 }
           }),

    );
  }

  Widget buildFavItem ({
    required String image,
    required double price,
    required String title,
    required int productId,
}) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: double.infinity,
      height: 110,
      child: Row(
        children: 
        [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(
                  title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  '\$ $price',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: (){controller.manageFavourites(productId);},
              icon: const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              ),
          ),
        ],
      ),
    ),
  );
}
