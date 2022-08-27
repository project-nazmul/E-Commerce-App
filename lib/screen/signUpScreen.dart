import 'package:e_commerce_app/firebase_service/signup_authentication.dart';
import 'package:e_commerce_app/widget/custom_button.dart';
import 'package:e_commerce_app/widget/password_field.dart';
import 'package:e_commerce_app/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final displayNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
          title: Text('Registration'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: Column(
            children: [
              Form(
                key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      textField(controller: displayNameController,icon: Icons.person,text: "Display Name",validator: (value){
                        if(GetUtils.isUsername(value!)){
                          return null;
                        }
                        return 'Enter valid username';
                      }),
                      SizedBox(height: 10,),
                      textField(controller: emailController,icon: Icons.email,text: "Email",validator: (value){
                        if(GetUtils.isEmail(value!)){
                          return null;
                        }
                        return 'Enter valid email';
                      }),
                      SizedBox(height: 10,),
                      passwordField(passwordController: passwordController,context: context),
                      SizedBox(height: 10,),
                      textField(controller: phoneController,icon: Icons.phone,text: "Phone",validator: (value){
                        if(GetUtils.isPhoneNumber(value!)){
                          return null;
                        }
                        return 'Enter valid phone number';
                      }),
                    ],
                  )
              ),
              SizedBox(height: 15,),
              customButton(
                text: "Sign up",
                onPressed: ()async{
                  if(formKey.currentState!.validate()){
                    await signUpAuthentication( email: emailController.text,password: passwordController.text,displayName: displayNameController.text,phone: phoneController.text);
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
