import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_button.dart';
import 'package:e_commerce_app/view/widgets/auth/check_widget.dart';
import 'package:e_commerce_app/view/widgets/auth/container_under.dart';
import 'package:e_commerce_app/view/widgets/auth/text_form_field.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode?  Colors.black : Colors.white ,
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
                              text: 'SIGN',
                              color: Get.isDarkMode ? pinkClr: mainColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(width: 5,),
                            TextUtils(
                              decoration: TextDecoration.none,
                              text: 'UP',
                              color: Get.isDarkMode ? Colors.white : Colors.black ,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50,),
                        AuthTextFormField(
                          controller: nameController,
                          obscureText: false,
                          validate: (value) {
                            if(value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value!))
                            {
                              return 'Enter valid name ..';
                            }else
                              {
                               return null ;
                              }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(Icons.person , color: pinkClr,size: 30,)
                              : Image.asset('assets/images/user.png'),
                          hintText: 'User Name',
                        ),
                        const SizedBox(height: 20,),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validate: (value) {
                            if(!RegExp(validationEmail).hasMatch(value!))
                            {
                              return ' Plz enter Email ..';
                            }else
                            {
                              return null ;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(Icons.email , color: pinkClr,size: 30,)
                              :  Image.asset('assets/images/email.png') ,
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
                                return 'Plz enter Password  ..';
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
                              Icon(Icons.visibility , color: Get.isDarkMode ? pinkClr :mainColor,size: 30,),
                            ),
                            hintText: 'Password',
                          );
                        },
                        ),
                        const SizedBox(height: 20,),
                        CheckWidget(),
                        const SizedBox(height: 30,),
                         GetBuilder<AuthController>(
                             builder: (_)
                             {
                               return AuthButton(
                                 onPressed: ()
                                 {
                                   if(controller.isCheckBox == false)
                                     {
                                       Get.snackbar(
                                         'Error!',
                                         'Plz Read terms & conditions and Accept ! ',
                                         snackPosition: SnackPosition.BOTTOM,
                                         backgroundColor: Colors.green,
                                         colorText: Colors.white,
                                       );
                                     }
                                   else if(formKey.currentState!.validate())
                                     {
                                       controller.signUpWithFirebase(
                                           name: nameController.text.trim(),
                                           email: emailController.text.trim(),
                                           password: passwordController.text,
                                       );
                                       controller.isCheckBox = true;
                                     }
                                 },
                                 text: 'Sign Up',
                               );
                             },
                         ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 70,),
                ContainerUnder(
                  text: 'Already have an account ',
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  textBtn: 'Log in',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      update();
    } on FirebaseAuthException catch (error) {
      String title = error.code;
      String message ='';
      if (error.code == 'weak-password') {
        message='The password provided is too weak.';
      }
      else if (error.code == 'email-already-in-use') {
        message='The account already exists for that email.';
      }
      else { message= error.message.toString();}
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }*/