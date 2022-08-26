import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:e_commerce_app/screen/admin_screen/add_new_product.dart';
import 'package:e_commerce_app/screen/admin_screen/manage_product.dart';
import 'package:e_commerce_app/screen/home_screen.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalStorage>(context,listen: false);
    return WillPopScope(
      onWillPop: () async{
        Get.off(HomeScreen());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Admin Homepage'),
          actions: [
            IconButton(
              onPressed: (){
                provider.removeEmail();
                provider.loadEmail();
                Get.off(LoginScreen());
              },
              icon: Icon(Icons.logout)
            )
          ],
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Get.to(AddNewProduct());
              },
              child: Text('Add new Product')),
            ElevatedButton(
              onPressed: (){
                Get.to(ManageProduct());
              },
              child: Text('Manage Product')),
          ],
        ),
      ),
    );
  }
}
