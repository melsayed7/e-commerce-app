import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/logic/controllers/card_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/product_details/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {

   final String imageUrl;
   ImageSlider({
     required this.imageUrl,
     Key? key
   }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  final cardController = Get.find<CardController>();
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  List<Color> selectedColor =[
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor1,
    kCOlor2,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:
      [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options:CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ) ,
          itemBuilder: (context, index, realIndex) => Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ) ,
        ),
        Positioned(
          bottom: 30,
          left: 140,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect:  ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
              dotColor: Colors.black
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentColor = index;
                  });
                },
                child: ColorPicker(
                    color: selectedColor[index],
                    outerBorder: currentColor == index,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 3,),
              itemCount: selectedColor.length,
            ),
          ) ,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [
              CircleAvatar(
                backgroundColor: Get.isDarkMode ? pinkClr.withOpacity(.6) : mainColor.withOpacity(.6),
                child: IconButton(
                  padding: const EdgeInsets.only(left: 8),
                    onPressed: (){Get.back();},
                    icon: const Icon(
                        Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                ),
              ),
              Badge(
                position: BadgePosition.topEnd(top: -10, end: -10),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent:  Text(
                  cardController.countCardItem().toString(),
                  style:  const TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Get.isDarkMode ? pinkClr.withOpacity(.6) : mainColor.withOpacity(.6),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cardScreen);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
