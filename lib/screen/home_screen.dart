import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('E-Commerce'),
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: (){
                Get.to(LoginScreen());
              },
                child: Text('Start')
            )
          ],
        ),
      ),
    );
  }
}
