import 'package:cloud_firestore/cloud_firestore.dart';

List products=[];
fetchProductImage()async{
  var getData=await FirebaseFirestore.instance.collection("products").get();
  for(int i=0;i<getData.docs.length;i++){
    products.add(getData.docs[i]["img"]);
  }
}