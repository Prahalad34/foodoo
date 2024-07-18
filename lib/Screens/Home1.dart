
import 'package:flutter/material.dart';
import 'package:foodoo/Screens/Magic_Bag.dart';
import 'package:foodoo/Screens/Offer_Food.dart';
import 'package:foodoo/Screens/Settings.dart';

import '../Constant/Appcolor.dart';
import 'Home.dart';
class Home1 extends StatefulWidget {

  final String email;
  final String password;

   Home1({required this.email, required this.password});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {

  int _currentIndex=0;
  List _screens=[Home(),Offer_Food(),Magic_Bag(),Settings()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Appcolor.PrimaryColor,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),

          ),
          BottomNavigationBarItem(
            label: "offer Food",
            icon: Icon(Icons.fastfood),
          ),
          BottomNavigationBarItem(
            label: "Magic Bag",
            icon: Icon(Icons.local_dining),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}