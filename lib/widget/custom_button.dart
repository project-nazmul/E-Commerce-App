import 'package:e_commerce_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

customButton({String? text,dynamic onPressed}){
  return MaterialButton(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
    color: Colors.blue,
    textColor: Colors.white,
    child: customText(text: text,fs: 20,clr: Colors.white,fw: FontWeight.bold),
    onPressed:onPressed,
  );
}