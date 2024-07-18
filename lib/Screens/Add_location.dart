
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constant/Appcolor.dart';
import 'Login.dart';
class Add_location extends StatefulWidget {
  const Add_location({super.key});

  @override
  State<Add_location> createState() => _Add_locationState();
}

class _Add_locationState extends State<Add_location> {


  int age = 10;


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Add Shop Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          leading: CircleAvatar(
              radius: 10,
              backgroundColor: Appcolor.PrimaryColor1,
              child: Icon(Icons.arrow_back))
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
                  Image.asset('assets/map.png'),
              SizedBox(height: 15,),
              Text('Select a distance',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Slider(
                activeColor: Appcolor.PrimaryColor,
                label: "Select Age",
                value: age.toDouble(),
                onChanged: (value) {
                  setState(() {
                    age = value.toInt();
                  });
                },
                min: 5,
                max: 100,
              ),
              Text(
                "Your Distance: " + age.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24)
                    ),
                    hintText: "Search for a city",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Appcolor.PrimaryColor1
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/Vector.svg'),
                  SizedBox(width: 5,),
                  Text("Use my current location",style: TextStyle(color: Appcolor.PrimaryColor),)
                ],
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Appcolor.PrimaryColor
                    ),
                    child: Center(child: Text('Choose this location',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
