import 'package:e_commerce_app/firebase_service/reset_password.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:e_commerce_app/widget/custom_button.dart';
import 'package:e_commerce_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final keyText = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Padding(
          padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70,),
              customText(text: "Enter email to get password reset link",fs: 17,fw: FontWeight.normal),
              SizedBox(height: 15,),
              Form(
                key: keyText,
                child: TextFormField(
                  validator:(value){
                    if(GetUtils.isEmail(value!)){
                      return null;
                    }
                    return 'Enter valid email';
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.blue,),
                      label: Text('Email'),
                      border: OutlineInputBorder()
                  ),
                ),
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
        ),
      ),
    );
  }
}
