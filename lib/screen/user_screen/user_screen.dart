import 'package:e_commerce_app/screen/user_screen/user_card_screen.dart';
import 'package:e_commerce_app/screen/user_screen/user_home_screen.dart';
import 'package:e_commerce_app/screen/user_screen/user_profile_screen.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int initialIndex=0;

  final pages = [
    UserHomeScreen(),
    UserCardScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[initialIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialIndex,

        onTap: (index){
          setState(() {
            initialIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ]
      ),
    );
  }
}
