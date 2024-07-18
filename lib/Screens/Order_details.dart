import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constant/Appcolor.dart';
class Order_details extends StatefulWidget {
  const Order_details({super.key});

  @override
  State<Order_details> createState() => _Order_detailsState();
}

class _Order_detailsState extends State<Order_details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(

          title: Text("Order details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Column(
                   children: [
                     Row(
                       children: [
                         Image.asset('assets/profile.png',height: 80,width: 100,),
                         Expanded(child: Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 children: [
                                   Expanded(child: Text('John Roi',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                                   SvgPicture.asset('assets/msg.svg'),
                                   SizedBox(width: 10,),
                                   Icon(Icons.phone)
                                 ],
                               ),
                             SizedBox(height: 10,),
                               Row(
                                 children: [
                                   //Icon(Icons.location_on,color: Appcolor.PrimaryColor,),
                                   Text('2972 Westheimer Rd. Santa Ana'),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Text('12 March 6:00PM',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
                               SizedBox(height: 5,),
                               Row(
                                 children: [
                                   Text('Payment',style: TextStyle(fontWeight: FontWeight.bold,color: Appcolor.PrimaryColor,fontSize: 15),),
                                   Icon(Icons.check_circle,color: Appcolor.PrimaryColor,size: 20,)
                                 ],
                               ),
                             ],
                           ),
                         )),
                        //  SvgPicture.asset('assets/msg.svg'),
                        // SizedBox(width: 10,),
                        //  Icon(Icons.phone)
                       ],
                     ),
                   ],
                 ),
                Divider(height: 10,),
                SizedBox(height: 15,),
                Text('Order Items',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/food1.png',fit: BoxFit.cover,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(arrname[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                  Row(
                                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Quantity: 2'),
                                      SizedBox(width: 60,),
                                      Text('\$56',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                                        ),
                    );
                },),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => Home1(),));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Appcolor.PrimaryColor
                    ),
                    child: Center(child: Text('Mark Complete',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

var arrname = ['Paneer cheese Roll','Vegetable Burger','Tomato Pasta','Paneer cheese Tikka'];
