import 'package:flutter/material.dart';

carosolImage(String img){
  return Container(
    margin: EdgeInsets.only(left: 7,right: 7,top: 4,bottom: 7),
    height: 150,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue,width: 10),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(img)
      ),
      borderRadius: BorderRadius.circular(40)
    ),

  );
}