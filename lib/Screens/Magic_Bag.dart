
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodoo/Screens/Add_Magic_Food.dart';
import 'package:foodoo/Screens/Details.dart';

import '../Constant/Appcolor.dart';
class Magic_Bag extends StatefulWidget {
  const Magic_Bag({super.key});

  @override
  State<Magic_Bag> createState() => _Magic_BagState();
}

class _Magic_BagState extends State<Magic_Bag> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          titleSpacing: -6,
          title: Text("Add Food",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          leading: CircleAvatar(
            backgroundColor: Appcolor.PrimaryColor1,
            child: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back),

            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(height: 1,),
          )

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.PrimaryColor,
        shape: CircleBorder(),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Magic_Food(),));
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(),));
                        },
                        child: Container(
                          //margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset('assets/addfood.png',fit: BoxFit.cover,),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 40,top: 40),
                                  //   child: Container(
                                  //     height: 30,
                                  //     width: 66,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(8),
                                  //         color: Appcolor.PrimaryColor3
                                  //     ),
                                  //     child: Center(child: Text("2 left",style: TextStyle(color: Colors.white),),),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 300,top: 30),
                                  //   child: Icon(Icons.favorite_border,color: Colors.white,),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 26,top: 162),
                                  //   child: Container(
                                  //     height: 45,
                                  //     width: 175,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(8),
                                  //         color: Colors.white38
                                  //     ),
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.center,
                                  //       children: [
                                  //         Icon(Icons.watch_later_outlined,color: Colors.white,),
                                  //         Text('Today, 2pm - 10 pm',style: TextStyle(color: Colors.white),)
                                  //       ],
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30,right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Chicken skewers with\nslices peppers',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text('\$20',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),)
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 30,right: 30),
                                  child: Row(
                                      children: [
                                        RatingBar(
                                          initialRating: 3,
                                          // Set the initial rating value
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          ratingWidget: RatingWidget(
                                            full: Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            half: Icon(Icons.star_half),
                                            empty: Icon(Icons.star_border),
                                          ),
                                          itemSize: 20.0,
                                          // Adjust the size of the rating stars
                                          itemPadding:
                                          EdgeInsets.symmetric(horizontal: 2.0),
                                          onRatingUpdate: (rating) {
                                            // Handle the rating update if needed
                                          },
                                        ),
                                        Expanded(child: Text('5.0')),
                                        SvgPicture.asset('assets/location.svg'),
                                        SizedBox(width: 5,),
                                        Text('30 KM')
                                      ]
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
