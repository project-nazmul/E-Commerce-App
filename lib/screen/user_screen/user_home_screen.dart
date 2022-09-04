import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:e_commerce_app/widget/custom_text.dart';
import 'package:e_commerce_app/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalStorage>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: (){
                provider.removeEmail();
                provider.loadEmail();
                Get.off(LoginScreen());
              },
              icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            textField(icon: Icons.search,text: "Search products",controller:searchController ),
            SizedBox(height: 30,),
            customText(text: "All Products",clr: Colors.blue,fs: 22,fw: FontWeight.bold),
            SizedBox(height: 10,),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("products-data").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            children: [
                              Expanded(flex:1,child: Container(
                                margin: EdgeInsets.only(right: 15,),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(snapshot.data!.docs[index]['img'])
                                    )

                                ),
                              )),
                              Expanded(flex:1,child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customText(text: snapshot.data!.docs[index]['name'],clr: Colors.white,fw: FontWeight.bold,fs: 20),
                                  SizedBox(height: 10,),
                                  customText(text: "BDT "+snapshot.data!.docs[index]['price'],clr: Colors.black.withOpacity(0.8),fw: FontWeight.bold,fs: 15),
                                ],
                              )),
                              Expanded(flex:1,child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: (){},
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll(Colors.blue.withOpacity(0.2))
                                          ),
                                          child: customText(text: "Details",clr: Colors.white,fw: FontWeight.bold,fs: 18)),
                                    ),
                                    SizedBox(height: 5,),
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll(Colors.blue.withOpacity(0.2))
                                          ),
                                          onPressed: (){},
                                          child: Icon(Icons.add_circle)
                                      ),
                                    ),

                                  ],
                                ),
                              )),
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(left: 5,right: 5,bottom: 5,top: 5),
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);

                },
              ),
            )
          ],
        ),
      )
    );
  }
}
