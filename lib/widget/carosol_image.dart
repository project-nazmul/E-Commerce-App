import 'package:flutter/material.dart';

carosolImage(Color clr){
  return Container(
    margin: EdgeInsets.only(left: 7,right: 7,top: 4,bottom: 7),
    height: 150,
    decoration: BoxDecoration(
      color: clr,
      borderRadius: BorderRadius.circular(40)
    ),

  );
}