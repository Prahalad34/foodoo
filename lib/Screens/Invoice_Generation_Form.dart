
import 'package:flutter/material.dart';
import 'package:foodoo/Screens/Payment_Confirmation.dart';

import '../Constant/Appcolor.dart';
class Invoice_Generation_Form extends StatefulWidget {
  const Invoice_Generation_Form({super.key});

  @override
  State<Invoice_Generation_Form> createState() => _Invoice_Generation_FormState();
}

class _Invoice_Generation_FormState extends State<Invoice_Generation_Form> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          titleSpacing: -6,
          title: Text("Invoice Generation Form",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
                Text('Billing Details:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Name:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(width: 45,),
                    Expanded(
                      child: Container(
                        width: 20,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)
                            ),
                            hintText: "John Roi"
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Email:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(width: 45,),
                    Expanded(
                      child: Container(
                        width: 20,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)
                              ),
                            hintText: "Johnroi@gmail.com"
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Address:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(width: 30,),
                    Expanded(
                      child: Container(
                        width: 20,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)
                              ),
                            hintText: "Washington, UK"
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Text('Services Provided:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Service\nDescription:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(width: 1,),
                    Expanded(
                      child: Container(
                        width: 20,
                        child: TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)
                              ),
                              hintText: "% pack of Offer food ..............."
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Total\nAmount',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(width: 30,),
                    Expanded(
                      child: Container(
                        width: 20,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)
                              ),
                              hintText: "\$540"
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Payment_Confirmation(),));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Appcolor.PrimaryColor
                    ),
                    child: Center(child: Text('Generate Invoice',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => Home1(),));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                       border: Border.all(color: Appcolor.PrimaryColor)
                    ),
                    child: Center(child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold,color: Appcolor.PrimaryColor),),),
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
