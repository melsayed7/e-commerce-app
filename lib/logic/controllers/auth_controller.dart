import 'package:e_commerce_app/model/facebook_model.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController
{
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  bool isSignIn = false;
  GetStorage authBox = GetStorage();

  User? get userProfile => FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
   displayUserName.value = (userProfile !=null ? userProfile!.displayName : "")!;
   displayUserPhoto.value = (userProfile !=null ? userProfile!.photoURL : "")!;
   displayUserEmail.value = (userProfile !=null ? userProfile!.email : "")!;
  }

  void visibility()
  {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox()
  {
    isCheckBox = !isCheckBox;
    update();
  }

  Future<void> signUpWithFirebase({
    required String name ,
    required String email ,
    required String password,
})  async
  {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    )
        .then((value) {
          displayUserName.value = name ;
          FirebaseAuth.instance.currentUser!.updateDisplayName(name);
          update();
          Get.offNamed(Routes.mainScreen);
          /*String title = value.toString();
          String message ='';
          if ( value.toString() == 'weak-password')
          {
            message='The password provided is too weak.';
          }
          else if (value.toString() == 'email-already-in-use')
          {
            message='The account already exists for that email.';
          }
          else
          {
            message= value.toString();
          }*/
          Get.snackbar(
            'Create User Message',
            ' User Created Successfully and you Login Successfully ..',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

        }).catchError((error){
          Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
        });

  }

  Future<void> loginWithFirebase({
    required String email ,
    required String password,
}) async
  {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
     displayUserName.value = FirebaseAuth.instance.currentUser!.displayName!;
     isSignIn = true ;
     authBox.write('loginSave', isSignIn);
     update();
     Get.offNamed(Routes.mainScreen);
    /* String title = value.toString();
     String message ='';
     if ( value.toString() == 'user-not-found')
     {
       message='No user found for that email.';
     }
     else if (value.toString() == 'wrong-password')
     {
       message='Wrong password provided for that user.';
     }
     else
     {
       message= value.toString();
     }*/
     Get.snackbar(
       'Login User Message',
       'Login Successfully ..',
       snackPosition: SnackPosition.BOTTOM,
       backgroundColor: Colors.green,
       colorText: Colors.white,
     );
    }).catchError((error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    });
  }

  void loginWithGoogle()
  async{
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
           displayUserName.value = googleUser!.displayName!;
           displayUserPhoto.value = googleUser.photoUrl!;
           displayUserEmail.value = googleUser.email;

           GoogleSignInAuthentication googleSignInAuthentication =
           await googleUser.authentication;
           final AuthCredential credential = GoogleAuthProvider.credential(
             idToken: googleSignInAuthentication.idToken,
             accessToken: googleSignInAuthentication.accessToken
           );

           await FirebaseAuth.instance.signInWithCredential(credential);

           isSignIn = true ;
           authBox.write('loginSave', isSignIn);
           update();
           Get.offNamed(Routes.mainScreen);
           Get.snackbar(
             'Login User Message',
             'Login Successfully with Google ..',
             snackPosition: SnackPosition.BOTTOM,
             backgroundColor: Colors.green,
             colorText: Colors.white,
           );

  }

  FaceBookModel? faceBookModel;
  Future<void> loginWithFacebook()
  async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if(loginResult.status  == LoginStatus.success )
      {
        final data= await FacebookAuth.instance.getUserData();
        faceBookModel = FaceBookModel.fromJson(data);
        isSignIn = true ;
        authBox.write('loginSave', isSignIn);
        update();
        Get.offNamed(Routes.mainScreen);
        Get.snackbar(
          'Login User Message',
          'Login Successfully with FaceBook ..',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

      }

  }


  Future<void> resetPassword(String email)
  async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    )
        .then((value) {
          update();
          Get.back();
          Get.snackbar(
            'Message',
            'New Password Message has been sent Successfully ,Check Email ..',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
      }).catchError((error){
        Get.snackbar(
          'Error!',
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      });
  }


  void signOut()
  async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.i.logOut();
    displayUserName.value = '';
    displayUserPhoto.value= '';
    displayUserEmail.value= '';
    isSignIn = false ;
    authBox.remove('loginSave');
    update();
    Get.offNamed(Routes.welcomeScreen);
  }

}