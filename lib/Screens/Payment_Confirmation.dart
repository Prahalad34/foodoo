import 'package:flutter/material.dart';

import '../Constant/Appcolor.dart';
class Payment_Confirmation extends StatefulWidget {
  const Payment_Confirmation({super.key});

  @override
  State<Payment_Confirmation> createState() => _Payment_ConfirmationState();
}

class _Payment_ConfirmationState extends State<Payment_Confirmation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          titleSpacing: -6,
          title: Text("Payment Confirmation",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
              children: [
                  Container(
                    height: 380,
                    width: 360,
                    color: Appcolor.PrimaryColor2,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Thank you for your payment!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                         SizedBox(height: 20,),
                          Text("Invoice Details:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                         SizedBox(height: 10,),
                          Text('Invoice Number: 546475'),
                          SizedBox(height: 10,),
                          Text('Date: 03/20/2024'),
                          SizedBox(height: 10,),
                          Text('Total Amount: \$540'),
                          SizedBox(height: 10,),
                          Text('Payment Method:  Credit Card')
                        ],
                      ),
                    ),
                  ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Payment_Confirmation(),));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                       border: Border.all(color: Appcolor.PrimaryColor)
                    ),
                    child: Center(child: Text('send to customer',style: TextStyle(fontWeight: FontWeight.bold,color: Appcolor.PrimaryColor),),),
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
