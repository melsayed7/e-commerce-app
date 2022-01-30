import 'package:e_commerce_app/view/screens/category_screen.dart';
import 'package:e_commerce_app/view/screens/favourite_screen.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController
{
  RxInt currentIndex = 0.obs ;
  final items =
      [
        HomeScreen(),
        CategoryScreen(),
        FavouritesScreen(),
        SettingsScreen(),
      ].obs ;

  final titles =
      [
        'Shopping',
        'Categories',
        'Favourites',
        'Setting'
      ].obs;

}