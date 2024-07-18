import 'package:flutter/material.dart';

import '../Constant/Appcolor.dart';
class Add_Offer_Food extends StatefulWidget {
  const Add_Offer_Food({super.key});

  @override
  State<Add_Offer_Food> createState() => _Add_Offer_FoodState();
}

class _Add_Offer_FoodState extends State<Add_Offer_Food> {


  bool _showTextFields = false;

  void _toggleTextFields() {
    setState(() {
      _showTextFields = !_showTextFields;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          titleSpacing: -6,
          title: Text("Add Offer Food  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          leading: CircleAvatar(
            backgroundColor: Appcolor.PrimaryColor1,
            child: TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Image.asset('assets/arrow1.png'),

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
                Text("Enter Food item Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Enter Food item Name",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Select category",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Select category",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Enter Original Price",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Enter Original Price",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Enter Offer Price",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Enter Offer Price",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Enter Description",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Enter Description",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Enter Quantity",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Enter Quantity",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add Extra item',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _toggleTextFields,
                      ),
                    ),
                  ],
                ),
              if (_showTextFields) ...[
                SizedBox(height: 10,),
                Text("Enter item",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Enter item",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Price",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Enter Quantity",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                  keyboardType: TextInputType.phone,
                ),
                ],
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
                    child: Center(child: Text('Next',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
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
