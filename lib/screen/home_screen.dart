import 'package:e_commerce_app/firebase_service/admin_or_user.dart';
import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalStorage>(context,listen: false);
    provider.loadEmail();
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
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
                  provider.email==null?Get.to(LoginScreen()):adminOrUser(email: provider.email.toString());
                },
                  child: Text('Start')
              )
            ],
          ),
        ),
      ),
    );
  }
}
