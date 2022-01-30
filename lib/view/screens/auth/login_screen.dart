import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_button.dart';
import 'package:e_commerce_app/view/widgets/auth/container_under.dart';
import 'package:e_commerce_app/view/widgets/auth/text_form_field.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();



  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode? Colors.black : Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Get.isDarkMode? Colors.black : Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children:
              [
                SizedBox(
                  //width: double.infinity,
                  //height: MediaQuery.of(context).size.height/1.3,
                  child:  Padding(
                    padding: const EdgeInsets.only(right: 30,left: 30,),
                    child: Column(
                      children: [
                        Row(
                          children:  [
                            TextUtils(
                              decoration: TextDecoration.none,
                              text: 'Log',
                              color: Get.isDarkMode ?  pinkClr : mainColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(width: 5,),
                            TextUtils(
                              decoration: TextDecoration.none,
                              text: 'IN',
                              color: Get.isDarkMode ?  Colors.white : Colors.black ,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50,),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validate: (value) {
                            if(!RegExp(validationEmail).hasMatch(value!))
                            {
                              return ' Invalid Email ..';
                            }else
                            {
                              return null ;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(Icons.email , color: pinkClr,size: 30,)
                              :Image.asset('assets/images/email.png'),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20,),
                        GetBuilder<AuthController>(builder: (controller)
                        {
                          return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false : true,
                            validate: (value) {
                              if(value.toString().length < 6 )
                              {
                                return 'Password should be longer or equal 6 characters ..';
                              }else
                              {
                                return null ;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? const Icon(Icons.lock , color: pinkClr,size: 30,)
                                : Image.asset('assets/images/lock.png') ,
                            suffixIcon: IconButton(
                              onPressed: () {controller.visibility();},
                              icon: controller.isVisibility ?
                              const Icon(Icons.visibility_off , color: Colors.black,size: 30,) :
                              Icon(Icons.visibility , color: Get.isDarkMode ? pinkClr :mainColor ,size: 30,),
                            ),
                            hintText: 'Password',
                          );
                        },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: ()
                            {
                              Get.toNamed(Routes.forgetPasswordScreen);
                            },
                            child: TextUtils(
                                text: 'Forget Password ?',
                                color: Get.isDarkMode ? Colors.white :  Colors.black ,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        //CheckWidget(),
                        const SizedBox(height: 30,),
                        GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate())
                                    {
                                      controller.loginWithFirebase(
                                          email: emailController.text.trim(),
                                          password: passwordController.text.trim(),
                                      );
                                    }
                                },
                                text: 'Login',
                              );
                            },
                        ),
                        const SizedBox(height: 20,),
                        Column(
                          children:
                          [
                            TextUtils(
                                text: 'OR',
                                color: Get.isDarkMode ?  Colors.white : Colors.black,
                                fontSize: 25 ,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                GetBuilder<AuthController>(
                                    builder: (_) {
                                      return IconButton(
                                        onPressed: ()
                                        {
                                          controller.loginWithFacebook();
                                        },
                                        icon: Image.asset('assets/images/facebook.png'),
                                      );
                                    },
                                ),
                                GetBuilder<AuthController>(
                                  builder: (_)
                                  {
                                  return IconButton(
                                    onPressed: (){
                                      controller.loginWithGoogle();
                                    },
                                    icon: Image.asset('assets/images/google.png'),
                                  );
                                 },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                ContainerUnder(
                  text: 'Don\'t have an account ',
                  onPressed: () {
                    Get.offNamed(Routes.signUpScreen);
                  },
                  textBtn: 'Sign up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
