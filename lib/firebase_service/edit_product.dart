import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screen/admin_screen/add_new_product.dart';
import 'package:e_commerce_app/widget/custom_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class EditProduct extends StatefulWidget {
  EditProduct({Key? key,required this.snapshot,required this.index,required this.currentImg}) : super(key: key);
  final AsyncSnapshot<QuerySnapshot> snapshot;
  final int index;
  XFile? image;
  String currentImg;
  String? img;
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  updateData({required String id}) async {
    if(widget.image==null){
      FirebaseFirestore.instance.collection("products-data").doc(id).update(
          {
            "name":nameController.text,
            "description":desController.text,
            "price":priceController.text,
          }
      ).then((value) => Fluttertoast.showToast(msg: '"Updated Successfully"')).catchError((error)=>Fluttertoast.showToast(msg: "something is wrong. $error"));
    }else{
      UploadTask uploadTask= FirebaseStorage.instance.ref('products-image').child(widget.image!.name).putFile(File(widget.image!.path));
      TaskSnapshot snapshot = await uploadTask;
      widget.img=await snapshot.ref.getDownloadURL();
      FirebaseFirestore.instance.collection("products-data").doc(id).update(
          {
            "name":nameController.text,
            "description":desController.text,
            "price":priceController.text,
            "img":widget.img
          }
      ).then((value) => Fluttertoast.showToast(msg: '"Updated Successfully"')).catchError((error)=>Fluttertoast.showToast(msg: "something is wrong. $error"));
    }

    nameController.clear();
    desController.clear();
    priceController.clear();

  }

  imageFromCamera()async{
    ImagePicker _picker = ImagePicker();
    XFile? imgX= await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      widget.image=imgX;
    });
  }

  imageFromGallery()async{
    ImagePicker _picker = ImagePicker();
    XFile? imgX= await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      widget.image=imgX;
    });
  }

  @override
  void initState() {
    nameController.text=widget.snapshot.data!.docs[widget.index]['name'];
    desController.text=widget.snapshot.data!.docs[widget.index]['description'];
    priceController.text=widget.snapshot.data!.docs[widget.index]['price'];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
                title: const Text('EDIT Product INFO'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.account_box),
                                  label: Text('Name'),
                                ),
                                controller: nameController,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.description),
                                  label: Text('Description'),
                                ),
                                controller: desController,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.attach_money),
                                  label: Text('Price'),
                                ),
                                controller: priceController,
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height:200,width:double.infinity,child: widget.image!=null?Image.file(File(widget.image!.path)):Image.network(widget.currentImg),),
                    SizedBox(height: 8,),
                    customButton(
                        text: "Choose Image",
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  title: Text("Choose option"),
                                  content: Column(
                                    children: [
                                      customButton(text: "From Gallery",onPressed: (){

                                        imageFromGallery();
                                        Get.back();
                                      }),
                                      customButton(text: "From Camera",onPressed: (){

                                        imageFromCamera();
                                        Get.back();
                                      }),
                                    ],
                                  )
                              );
                            },
                          );
                        }
                    ),

                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {



                        //Replacing with edited data
                        updateData(id: widget.snapshot.data!.docs[widget.index].id);


                        Navigator.pop(context);
                      },
                      child: const Text('Submit'))
                ],
              );

  }
}