import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:e_commerce_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalStorage>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: (){
                provider.removeEmail();
                provider.loadEmail();
                Get.to(HomeScreen());
              },
              icon: Icon(Icons.logout)
          )
        ],
      ),
    );
  }
}
