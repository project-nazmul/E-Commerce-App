import 'package:e_commerce_app/firebase_service/admin_or_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

signInAuthentication({required BuildContext context,required String email, required String password})async{
  UserCredential result;
  final auth= FirebaseAuth.instance;
  try{
    result= await auth.signInWithEmailAndPassword(email: email, password: password);
    try{
      if(result.user != null){
        if(result.user!.emailVerified){
          adminOrUser(email: result.user!.email.toString());
        }else{
          Get.snackbar('Hi', 'Email Not Verified');
        }
      }
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.snackbar('Hi', 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      Get.snackbar('Hi', 'Wrong password provided for that user.');

    }
  }catch(e){
    if (kDebugMode) {
      print(e);
    }
  }

}