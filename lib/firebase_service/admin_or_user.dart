import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screen/admin_screen/admin_home.dart';
import 'package:e_commerce_app/screen/user_screen/user_screen.dart';
import 'package:get/get.dart';


adminOrUser({required String email}) async {
  var docSnapshot = await FirebaseFirestore.instance.collection('users-data').doc(email).get();
  String value = docSnapshot.data()!['role'];
  if(value=='user'){
    Get.to(UserScreen());
  }else if(value=='admin'){
    Get.to(AdminHome());
  }
}