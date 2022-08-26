import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:e_commerce_app/screen/home_screen.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

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
          title: Text('Home'),
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
      ),
    );
  }
}
