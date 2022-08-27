import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

passwordField({TextEditingController? passwordController,BuildContext? context}){
  final provider = Provider.of<LocalStorage>(context!,listen: true);
  return TextFormField(
    obscureText: provider.obsecurePassword,
    validator: (value){
      if(value!.length<8){
        return 'Need 8 character or more';
      }
      return null;
    },
    controller: passwordController,
    decoration: InputDecoration(
        suffixIcon: provider.obsecurePassword?IconButton(icon:Icon(Icons.visibility_off,color: Colors.grey,), onPressed: () {provider.obsecurePassword=false;},):
        IconButton(icon:Icon(Icons.visibility,color: Colors.blue,), onPressed: () {provider.obsecurePassword=true;},),
        prefixIcon: Icon(Icons.lock,color: Colors.blue,),
        label: Text('Password'),
        border: OutlineInputBorder()
    ),
  );
}