
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodoo/Constant/Appcolor.dart';
import 'package:foodoo/Screens/Add_Shop_Details.dart';
import 'package:foodoo/Screens/Analytics_and_Reporting.dart';
import 'package:foodoo/Screens/Change_Password.dart';
import 'package:foodoo/Screens/Edit_Profile.dart';
import 'package:foodoo/Screens/Invoice_Generation_Form.dart';
import 'package:foodoo/Screens/Privacy_policy.dart';
import 'package:foodoo/Screens/Set_weekly_pickup_schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool _isShown = true;

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const  CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 22,
              // backgroundColor: Colors.red.shade50,
              child: Icon(Icons.logout,color: Appcolor.PrimaryColor,),
            ),
            content: const Text('Are you sure you wantto Logout?',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Remove the box
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Appcolor.PrimaryColor)
                      ),
                      child: Center(child: const Text('No')))),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    logout();
                  },
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Appcolor.PrimaryColor
                      ),
                      child: Center(child: const Text('Yes'))))
            ],
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: AppBar(
        toolbarHeight: 250,
        // Set this height
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
                     color: Appcolor.PrimaryColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 110,left: 120,right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                        child: Image.asset('assets/profile.png'))
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 225,left: 150,right: 20),
                    child: Text('John Roi',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  )
                ],
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Profile(),));
                   },
                   child: Container(
                     height: 60,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                       color: Colors.white
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Row(
                         children: [
                           SvgPicture.asset('assets/profi.svg'),
                           SizedBox(width: 5,),
                           Expanded(child: Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                           Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                         ],
                       ),
                     ),
                   ),
                 ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Change_Password(),));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(Icons.lock,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(child: Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                          Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Shop_Details(),));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/profi1.svg'),
                          SizedBox(width: 5,),
                          Expanded(child: Text("Edit Shop details",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                          Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/profi2.svg'),
                        SizedBox(width: 5,),
                        Expanded(child: Text("History",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                        Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Analytics_and_Reporting(),));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/profi2.svg'),
                          SizedBox(width: 5,),
                          Expanded(child: Text(" Analytics and Reporting ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                          Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Invoice_Generation_Form(),));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/profi3.svg'),
                          SizedBox(width: 5,),
                          Expanded(child: Text("Generate Invoice",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                          Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Set_weekly_pickup_schedule(),));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/profi4.svg'),
                          SizedBox(width: 5,),
                          Expanded(child: Text("Set weekly pickup Shedule",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                          Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy(),));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/profi5.svg'),
                          SizedBox(width: 5,),
                          Expanded(child: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                          Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: (){
                        logout();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/profi6.svg'),
                          TextButton(
                              onPressed: _isShown == true ? () => _delete(context) : null,
                              child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                         // Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }


}
