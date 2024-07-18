import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../Constant/Appcolor.dart';
class Analytics_and_Reporting extends StatefulWidget {
  const Analytics_and_Reporting({super.key});

  @override
  State<Analytics_and_Reporting> createState() => _Analytics_and_ReportingState();
}

class _Analytics_and_ReportingState extends State<Analytics_and_Reporting> {

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }


  int isVAlue = 0;



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          titleSpacing: -6,
          title: Text("Analytics and Reporting  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 15,),
               Text('Date Range:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 15,),
              Container(
                height: 65,
                color: Appcolor.PrimaryColor2,
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Start Date:'),
                      Expanded(
                        child: TextField(
                          controller: dateinput,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none
                                )
                              ),
                              hintText: "Select",
                              suffixIcon: Icon(Icons.date_range),
                            filled: true,
                            fillColor: Colors.white
                          ),
                          readOnly: true,  //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(),
                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101)
                            );

                            if(pickedDate != null ){
                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateinput.text = formattedDate; //set output date to TextField value.
                              });
                            }else{
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('End Date:'),
                      Expanded(
                        child: TextField(
                          controller: dateinput,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none
                                  )
                              ),
                              hintText: "Select",
                              suffixIcon: Icon(Icons.date_range),
                              filled: true,
                              fillColor: Colors.white
                          ),
                          readOnly: true,  //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(),
                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101)
                            );

                            if(pickedDate != null ){
                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateinput.text = formattedDate; //set output date to TextField value.
                              });
                            }else{
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text('Filters:'),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        setState(() {
                          isVAlue =0;
                        });
                        Fluttertoast.showToast(
                          msg: "Sales",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                 },
                      child: Container(
                        height:35,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color:isVAlue==0? Appcolor.PrimaryColor:Colors.white
                        ),
                        child: Center(child: Text("Sales",style: TextStyle(color:isVAlue==0? Colors.white:Colors.black,fontWeight: FontWeight.bold),),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isVAlue =1;
                        });
                        Fluttertoast.showToast(
                          msg: "Popular items",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Container(
                        height:35,
                        width: 126,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color:isVAlue==1? Appcolor.PrimaryColor:Colors.white
                        ),
                        child: Center(child: Text("Popular items",style: TextStyle(color: isVAlue==1? Colors.white:Colors.black,fontWeight: FontWeight.bold),),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isVAlue =2;
                        });
                        Fluttertoast.showToast(
                          msg: "Feedback",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Container(
                        height:35,
                        width: 94,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color:isVAlue==2? Appcolor.PrimaryColor:Colors.white
                        ),
                        child: Center(child: Text("Feedback",style: TextStyle(color: isVAlue==2? Colors.white:Colors.black,fontWeight: FontWeight.bold),),),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
