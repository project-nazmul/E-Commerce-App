import 'package:e_commerce_app/firebase_service/signup_authentication.dart';
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
    return Scaffold(
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
                    TextFormField(
                      validator:(value){
                        if(GetUtils.isUsername(value!)){
                          return null;
                        }
                        return 'Enter valid username';
                      },
                      controller: displayNameController,
                      decoration: InputDecoration(
                          label: Text('Display Name'),
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      validator:(value){
                        if(GetUtils.isEmail(value!)){
                          return null;
                        }
                        return 'Enter valid email';
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          label: Text('Email'),
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (value){
                        if(value!.length<8){
                          return 'Password must be more than 8 characters';
                        }
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (value){
                        if(GetUtils.isPhoneNumber(value!)){
                          return null;
                        }
                        return 'Enter valid phone number';
                      },
                      controller: phoneController,
                      decoration: InputDecoration(
                          label: Text('Phone'),
                          border: OutlineInputBorder()
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: ()async{
              if(formKey.currentState!.validate()){
                await signUpAuthentication( email: emailController.text,password: passwordController.text,displayName: displayNameController.text,phone: phoneController.text);
              }

            }, child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
