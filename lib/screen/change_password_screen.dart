import 'package:e_commerce_app/firebase_service/reset_password.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:e_commerce_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final keyText = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back)
        ),
        title: Text('Change Password'),
      ),
      body: Column(
        children: [
          Text('Enter email to get password reset link'),
          Form(
            key: keyText,
            child: TextFormField(
              validator: (value){
                if(GetUtils.isEmail(value!)){
                  return null;
                }
                return 'Invalid email';
              },
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder()
              ),
            )
          ),
          customButton(
            text: "Send password reset link",
            onPressed: (){
              if(keyText.currentState!.validate()){
                resetPassword(emailController.text);
                Get.off(LoginScreen());
              }

            }
          ),
        ],
      ),
    );
  }
}
