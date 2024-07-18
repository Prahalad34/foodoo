import 'package:flutter/material.dart';

import '../Constant/Appcolor.dart';
class Set_weekly_pickup_schedule extends StatefulWidget {
  const Set_weekly_pickup_schedule({super.key});

  @override
  State<Set_weekly_pickup_schedule> createState() => _Set_weekly_pickup_scheduleState();
}

class _Set_weekly_pickup_scheduleState extends State<Set_weekly_pickup_schedule> {

  List<bool> _isCheckedList = List.generate(7, (index) => false);
  bool agree = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    // Do something
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        titleSpacing: -6,
        title: Text("Set weekly pickup schedule",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
                Text("This schedule repeat weekly",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Appcolor.PrimaryColor, // Use your custom color
                              value: _isCheckedList[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  _isCheckedList[index] = value!;
                                });
                              },
                            ),
                            SizedBox(width: 15,),
                            Expanded(child: Text(arrname[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                            Container(
                              height: 30,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white
                              ),
                              child: Center(child: Text('03:00 PM',style: TextStyle(fontWeight: FontWeight.bold),),),
                            ),
                            SizedBox(width: 8,),
                            Text('-'),
                            SizedBox(width: 8,),
                            Container(
                              height: 30,
                              width: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white
                              ),
                              child: Center(child: Text('04:00 PM',style: TextStyle(fontWeight: FontWeight.bold),),),
                            )
                          ],
                        )
                    ],
                  );
                },),
                SizedBox(
                  height: 60,
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
                    child: Center(child: Text('Add',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
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

 var arrname = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
