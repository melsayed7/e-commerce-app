import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_button.dart';
import 'package:e_commerce_app/view/widgets/auth/text_form_field.dart';
import 'package:e_commerce_app/view/widgets/auth/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0.0,
          title: TextUtils(
              text: 'Forget Password',
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontSize: 30,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
          ),
          leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Get.isDarkMode ? Colors.white : darkGreyClr ,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children:
                [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: (){Get.back();},
                      icon:  Icon(
                        Icons.close_rounded,
                        color: Get.isDarkMode ? Colors.white : Colors.black ,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                   Text('If you want to recover your account ,'
                      ' then please provide your email ID below ..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black ,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Image.asset('assets/images/forgetpass copy.png',width: 260,),
                  //const SizedBox(height: 5,),
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
                        :  Image.asset('assets/images/email.png') ,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 40,),
                  GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthButton(
                          text: 'Send',
                          onPressed: ()
                          {
                            if(formKey.currentState!.validate())
                              {
                                controller.resetPassword(emailController.text.trim());
                              }
                          },
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
