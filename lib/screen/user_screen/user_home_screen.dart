import 'package:e_commerce_app/firebase_service/fetch_image.dart';
import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
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
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                  image: NetworkImage(images[index].toString()))
            ),
          );
        },
      ),
    );
  }
}
