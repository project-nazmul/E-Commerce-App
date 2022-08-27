import 'package:e_commerce_app/firebase_service/signin_authentication.dart';
import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:e_commerce_app/screen/change_password_screen.dart';
import 'package:e_commerce_app/screen/home_screen.dart';
import 'package:e_commerce_app/screen/signUpScreen.dart';
import 'package:e_commerce_app/widget/custom_button.dart';
import 'package:e_commerce_app/widget/custom_text.dart';
import 'package:e_commerce_app/widget/password_field.dart';
import 'package:e_commerce_app/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalStorage>(context,listen: true);
    return WillPopScope(
      onWillPop: ()async{
        Get.off(HomeScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: customText(text: "Login Form"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.off(HomeScreen());
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                customText(text: "Login with your email and password",fs: 17,fw: FontWeight.normal),
                SizedBox(height: 15,),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      textField(text: "Email",icon: Icons.email,controller: emailController,validator:(value){
                        if(GetUtils.isEmail(value!)){
                          return null;
                        }
                        return 'Enter valid email';
                      } ),
                      SizedBox(height: 10,),
                      passwordField(passwordController: passwordController,context: context)
                    ],
                  )
                ),
                SizedBox(height: 10,),

                //Forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(ChangePasswordScreen());
                      },
                      child: customText(text: "Forgot password?",fs: 17,fw: FontWeight.normal,clr: Colors.blue))
                  ],
                ),
                SizedBox(height: 10,),

                //Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customButton(
                      text: "Login",
                      onPressed: ()async{
                        if(formKey.currentState!.validate()){
                          await signInAuthentication(context: context,email: emailController.text, password: passwordController.text);
                        }
                      }
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                //Sign Up
                Row(
                  children: [
                    customText(text: "Don't have an account?",fs: 17,fw: FontWeight.normal),
                    InkWell(
                      onTap: (){
                        Get.to(SignUpScreen());
                      },
                      child: customText(text: "Sign Up",fs: 17,fw: FontWeight.bold,clr: Colors.blue),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
