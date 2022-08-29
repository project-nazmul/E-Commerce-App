import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


List images = [];
fetchImage()async{
  QuerySnapshot qn  = await FirebaseFirestore.instance.collection("images").get();
    for(int i=0;i<qn.docs[0]["image"].length;i++){
      images.add(qn.docs[0]["image"][i]);
    }

}

