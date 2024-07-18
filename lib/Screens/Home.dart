
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodoo/Constant/Appcolor.dart';
import 'package:foodoo/Screens/Order_details.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int isActive = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
             SvgPicture.asset('assets/location.svg'),
            SizedBox(width: 4,),
            Expanded(child: Text('Road name,Qatar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
            Icon(Icons.notifications_none),
            SizedBox(width: 10,),
            SvgPicture.asset('assets/msg.svg')
          ],
        ),
        automaticallyImplyLeading: false,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(height: 1,),
          )
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  height: 70,
                  color: Appcolor.PrimaryColor2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap:(){
                          setState(() {
                            isActive =0;
                          });
                          Fluttertoast.showToast(
                            msg: "New Order",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          },
                          child: Text('New Order ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: isActive==0? Appcolor.PrimaryColor: Colors.black),)),
                      InkWell(
                        onTap: (){
                          setState(() {
                            isActive =1;
                          });
                          Fluttertoast.showToast(
                            msg: "Completed",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        },
                          child: Text('Completed ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: isActive==1?Appcolor.PrimaryColor:Colors.black),))
                    ],
                  ),
                ),
                isActive ==0?
                NewOrder():
                Completed()

              ],
        ),
      ),
    ));
  }
  Widget NewOrder()=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 583,
            child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Order_details(),));
                    },
                    child: Container(
                      height: 140,
                      // margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Image.asset('assets/man2.png'),
                                SizedBox(width: 10,),
                                Expanded(child: Text(arrname[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                                Text('Payment',style: TextStyle(fontWeight: FontWeight.bold,color: Appcolor.PrimaryColor,fontSize: 15),),
                                Icon(Icons.check_circle,color: Appcolor.PrimaryColor,size: 20,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Row(
                              children: [
                                Text(' 2 pic Chicken roll,1 Plate Rice'),
                                Text('View more',style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              children: [
                                Icon(Icons.location_on,color: Appcolor.PrimaryColor,),
                                Text('2972 Westheimer Rd. Santa Ana',style: TextStyle(),)
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Appcolor.PrimaryColor
                                  ),
                                  child: Center(child: Text('Mark Complete',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 25,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Appcolor.PrimaryColor
                                  ),
                                  child: Center(child: Text('Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 25,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Appcolor.PrimaryColor
                                  ),
                                  child: Center(child: Text('Chat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },),
          )
        ],
      ),
    ),
  );
  Widget Completed()=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 583,
            child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 140,
                    // margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Image.asset('assets/man2.png'),
                              SizedBox(width: 10,),
                              Expanded(child: Text(arrname[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                              Text('Payment',style: TextStyle(fontWeight: FontWeight.bold,color: Appcolor.PrimaryColor,fontSize: 15),),
                              Icon(Icons.check_circle,color: Appcolor.PrimaryColor,size: 20,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Row(
                            children: [
                              Text(' 2 pic Chicken roll,1 Plate Rice'),
                              Text('View more',style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: [
                              Icon(Icons.location_on,color: Appcolor.PrimaryColor,),
                              Text('2972 Westheimer Rd. Santa Ana',style: TextStyle(),)
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 45,right: 15 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                              //   height: 25,
                              //   width: 100,
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(8),
                              //       color: Appcolor.PrimaryColor
                              //   ),
                              //   child: Center(child: Text('Mark Complete',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                              // ),
                              // SizedBox(width: 10,),
                              Container(
                                height: 25,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Appcolor.PrimaryColor
                                ),
                                child: Center(child: Text('Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                              ),
                              Text('Give Ratings',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Appcolor.PrimaryColor),)
                              // SizedBox(width: 10,),
                              // Container(
                              //   height: 25,
                              //   width: 45,
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(8),
                              //       color: Appcolor.PrimaryColor
                              //   ),
                              //   child: Center(child: Text('Chat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },),
          )
        ],
      ),
    ),
  );
}

var arrname = ['John Roi','Robert Fox','Theresa Webb','Jane Cooper','John Roi','Robert Fox'];
