import 'package:e_commerce_app/firebase_service/signin_authentication.dart';
import 'package:e_commerce_app/screen/change_password_screen.dart';
import 'package:e_commerce_app/screen/home_screen.dart';
import 'package:e_commerce_app/screen/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.off(HomeScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
            child: Column(
              children: [
                Text('Login Form'),
                SizedBox(height: 15,),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                            return 'Need 8 character or more';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder()
                        ),
                      ),
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
                      child: Text('Forgot Password?',style: TextStyle(color: Colors.blue),))
                  ],
                ),
                SizedBox(height: 10,),

                //Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: ()async{
                      if(formKey.currentState!.validate()){
                        await signInAuthentication(context: context,email: emailController.text, password: passwordController.text);
                      }
                    }, child: Text('Login')),
                  ],
                ),
                SizedBox(height: 10,),

                //Sign Up
                Row(
                  children: [
                    Text("Don't have an account?"),
                    InkWell(
                      onTap: (){
                        Get.to(SignUpScreen());
                      },
                      child: Text('Sign Up',style: TextStyle(color: Colors.blue),)
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
