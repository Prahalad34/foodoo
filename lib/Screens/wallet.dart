import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constant/Appcolor.dart';
class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("wallet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
        leading: CircleAvatar(
          backgroundColor: Appcolor.PrimaryColor1,
          child: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SvgPicture.asset('assets/back.svg'),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,top: 65),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your Balance',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          SizedBox(height: 5,),
                          Text('\$1,200,150',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
                          SizedBox(height: 15,),
                          Container(
                            height: 48,
                            width: 116,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white
                            ),
                            child: Center(child: Text('Withdraw'),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Withdraw History',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Card(
                        child: Container(
                          height: 37,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white
                          ),
                          child: Center(child: Text('Apply for withdraw'),),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                     height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20,right: 20 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('20 March 2024')
                              ],
                            ),
                            Text('\$545',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('1:03PM')
                              ],
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
        ),
      ),
    ));
  }
}
