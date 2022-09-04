import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screen/admin_screen/manage_product.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_commerce_app/widget/custom_button.dart';
import 'package:e_commerce_app/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

final nameController = TextEditingController();

final desController = TextEditingController();

final priceController = TextEditingController();
class AddNewProduct extends StatefulWidget {

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {


  final keys = GlobalKey<FormState>();

  XFile? image;
  String? img;

  sendProductDB()async{
    await FirebaseFirestore.instance.collection("products-data").add({
      "name":nameController.text,
      "description":desController.text,
      "price":priceController.text,
      "img":img
    });
  }

  imageFromCamera()async{
    ImagePicker _picker = ImagePicker();
    XFile? img= await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      image=img;
    });
    writeImage();
  }

  imageFromGallery()async{
    ImagePicker _picker = ImagePicker();
    XFile? img= await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image=img;
    });
    writeImage();
  }
  writeImage()async{
    TaskSnapshot taskSnapshot=await FirebaseStorage.instance.ref('products-image').child(image!.name).putFile(File(image!.path));
    img = await taskSnapshot.ref.getDownloadURL();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8,top: 20),
        child: Column(
          children: [
            Form(
              key: keys,
                child: Column(
              children: [
                textField(controller: nameController,icon: Icons.person,text: "Name",
                    validator: (value){
                      if(value.length<3){
                        return "Enter a name please";
                      }
                      return null;
                    }
                ),
                SizedBox(height: 8,),
                textField(controller: desController,icon: Icons.description,text: "Description",
                    validator: (value){
                      if(value.length<3){
                        return "Enter a Des please";
                      }
                      return null;
                    }
                ),
                SizedBox(height: 8,),
                textField(controller: priceController,icon: Icons.attach_money,text: "Price",
                    validator: (value){
                      if(value.length<2){
                        return "Enter a name please";
                      }
                      return null;
                    }
                ),
              ],
            )),
            SizedBox(height: 8,),
            SizedBox(height:200,width:double.infinity,child: image!=null?Image.file(File(image!.path),fit: BoxFit.fill,):Icon(Icons.image,size: 200,)),
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
            customButton(text: "Submit",onPressed: (){
              if(keys.currentState!.validate()&&img!=null){

                  sendProductDB();
                  nameController.clear();
                  desController.clear();
                  priceController.clear();
                  print("Product added");
                  Get.off(ManageProduct());

              }else{
                print("Put all information");
              }

            })
          ],
        ),
      )
    );
  }
}
