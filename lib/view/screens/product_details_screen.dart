import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/view/widgets/auth/product_details/add_card.dart';
import 'package:e_commerce_app/view/widgets/auth/product_details/clothes_info.dart';
import 'package:e_commerce_app/view/widgets/auth/product_details/image_slider.dart';
import 'package:e_commerce_app/view/widgets/auth/product_details/size_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductDetailsScreen extends StatelessWidget {

  final ProductModel productModel;
  const ProductDetailsScreen({
    required this.productModel,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
               [
                 ImageSlider(
                   imageUrl: productModel.image,
                ),
                 ClothesInfo(
                 title: productModel.title,
                 productId: productModel.id,
                 rate: productModel.rating.rate,
                 description: productModel.description,
               ),
                 const SizeList(),
                 AddCard(
                   productModel: productModel,
                   price:  productModel.price,
                 ),
              ],
            ),
          ),
        ),
    );
  }
}
