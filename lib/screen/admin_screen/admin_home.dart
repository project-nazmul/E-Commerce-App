import 'package:e_commerce_app/screen/admin_screen/add_new_product.dart';
import 'package:e_commerce_app/screen/admin_screen/manage_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Homepage'),
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
    );
  }
}
