import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
             const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const SizedBox(
                    height: 450,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: ()
                    {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: const TextUtils(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.white,
                      text: 'Get Start',
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const TextUtils(
                        text: 'Don\'t have an account ?',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: ()
                        {
                          Get.offNamed(Routes.signUpScreen);
                        },
                          child: const TextUtils(
                              text: 'SignUp',
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
