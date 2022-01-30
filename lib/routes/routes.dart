import 'package:e_commerce_app/logic/bindings/auth_binding.dart';
import 'package:e_commerce_app/logic/bindings/main_binding.dart';
import 'package:e_commerce_app/logic/bindings/product_binding.dart';
import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/view/screens/auth/forget_password_screen.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_app/view/screens/card_screen.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:e_commerce_app/view/screens/payment_screen.dart';
import 'package:e_commerce_app/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes
{
  //initialRoute
  static const welcomeScreen = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen ;
  //getPages
  static final routes =
  [
    GetPage(
      name: Routes.welcomeScreen,
      page: ()=>const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: ()=>  LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: ()=>  SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: ()=>  ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: ()=>   MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cardScreen,
      page: ()=>  CardScreen(),
      bindings:
      [
        AuthBinding(),
        ProductBinding(),
      ] ,
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: ()=>   PaymentScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
  ];

}

class Routes
{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cardScreen = '/cardScreen';
  static const paymentScreen = '/paymentScreen';
}