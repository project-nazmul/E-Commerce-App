import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

resetPassword(String email) async{

  final auth= FirebaseAuth.instance;
  try{
     await auth.sendPasswordResetEmail(email: email);
     Get.snackbar('Hi', 'CHECK email.');
  }on FirebaseAuthException catch (e){
    if (e.code == 'user-not-found') {
      Get.snackbar('Hi', 'No user found for that email.');
    }
  }catch(e){
    print(e);
  }

}