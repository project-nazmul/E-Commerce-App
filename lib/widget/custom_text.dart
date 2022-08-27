
import 'package:flutter/material.dart';

customText({String? text,Color? clr,double? fs,FontWeight? fw}){
  return Text(text.toString(),style: TextStyle(
    color: clr,
    fontSize: fs,
    fontWeight: fw,
  ),);
}