import 'package:e_commerce_app/firebase_service/send_user_data_to_db.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

signUpAuthentication({required String email, required String password, required String displayName, required String phone})async{
  UserCredential result;
  final auth= FirebaseAuth.instance;
  try{
    result= await auth.createUserWithEmailAndPassword(email: email, password: password);
    try{
      if(result.user != null){
        auth.currentUser!.sendEmailVerification();
        sendUserDataToDB(displayName: displayName, email: email, phone: phone);
        Get.snackbar('Hi', 'Verify Email');
        Get.off(LoginScreen());
      }
    }catch(e){if (kDebugMode) {
      print(e);
    }}
  }on FirebaseAuthException catch (e){
    if (e.code == 'email-already-in-use') {
      Get.snackbar('Hi', 'The account already exists for that email.');
    }
  }catch(e){if (kDebugMode) {
    print(e);
  }}



}