import 'package:e_commerce_app/firebase_service/admin_or_user.dart';
import 'package:e_commerce_app/local_storage/local_storage.dart';
import 'package:e_commerce_app/screen/login_screen.dart';
import 'package:e_commerce_app/widget/carosol_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/widget/custom_button.dart';
import 'package:e_commerce_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<Container> pages = [
    carosolImage("assets/images/carousel1.jpg"),
    carosolImage("assets/images/carousel2.jpg"),
    carosolImage("assets/images/carousel3.jpg"),

  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalStorage>(context,listen: true);
    provider.loadEmail();
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CarouselSlider(
                      items: pages,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: double.infinity,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (val,changed){
                          provider.index=val;
                        },
                        initialPage: provider.index,
                      )
                  ),
                ),
                DotsIndicator(
                  dotsCount: pages.length,
                  position: provider.index.toDouble(),
                  decorator: DotsDecorator(
                    size: Size(10, 10),
                    activeSize:Size(10, 10),

                    color: Colors.black, // Inactive color
                    activeColor: Colors.deepOrange,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 7),
                  margin: EdgeInsets.only(top: 40),
                  width: double.infinity,
                  color: Colors.blue.withOpacity(0.5),
                  child: customText(text: "Online Shopping",fw: FontWeight.bold,clr: Colors.white,fs: 30),
                ),
                customButton(
                  text: 'Start Now',
                  onPressed: (){
                    provider.email==null?Get.off(LoginScreen()):adminOrUser(email: provider.email.toString());
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
