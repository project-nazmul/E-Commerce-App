import 'package:e_commerce_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCardScreen extends StatelessWidget {
  const UserCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.off(HomeScreen());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Card'),
        ),
      ),
    );
  }
}
