import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

sendUserDataToDB({required String displayName, required String email, required String phone})async{

 await FirebaseFirestore.instance.collection("users-data").doc(email).set({
  "displayName":displayName,
  "email":email,
  "phone":phone,
  "role":"user",
 }).then((value) => Get.snackbar('hi', 'inserted ')).catchError((error)=>Get.snackbar('hi', '"something is wrong. $error"'));
}
