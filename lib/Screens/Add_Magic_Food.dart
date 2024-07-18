import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../Constant/Appcolor.dart';
class Add_Magic_Food   extends StatefulWidget {
  const Add_Magic_Food  ({super.key});

  @override
  State<Add_Magic_Food  > createState() => _Add_Magic_FoodState();
}

class _Add_Magic_FoodState extends State<Add_Magic_Food  > {

  bool Small = false;
  bool Medium = false;
  bool Large = false;



  File? _image;


  void _showPicker(BuildContext context, int imageNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Image'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Gallery'),
                  onTap: () {
                    _getImage(ImageSource.gallery, imageNumber);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImage(ImageSource.camera, imageNumber);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _getImage(ImageSource source, int imageNumber) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _image = File(pickedFile.path);
        }
      });
    }
  }

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
          title: Text("Add Magic Food  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
                SizedBox(height: 15,),
                Text('Choose bag size',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 15),),
               SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                         Small = true;
                         Medium = false;
                         Large = false;
                        });
                        Fluttertoast.showToast(
                          msg: "Small  ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Card(
                        child: Container(
                          height: 65,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Appcolor.PrimaryColor1
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Small ?Icon(Icons.circle,color: Colors.black,):
                                      Icon(Icons.circle_outlined),
                                  SizedBox(width: 5,),
                                  Text('Small'),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18,top: 3),
                                child: Text('15.00 CAD',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          Small = false;
                          Medium = true;
                          Large = false;
                        });
                        Fluttertoast.showToast(
                          msg: "Medium",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Card(
                        child: Container(
                          height: 65,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Appcolor.PrimaryColor1
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Medium ?Icon(Icons.circle,color: Colors.black,):
                                  Icon(Icons.circle_outlined),
                                  SizedBox(width: 5,),
                                  Text('Medium'),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18,top: 3),
                                child: Text('18.00 CAD',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          Small = false;
                          Medium = false;
                          Large = true;
                        });
                        Fluttertoast.showToast(
                          msg: "Large",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Card(
                        child: Container(
                          height: 65,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Appcolor.PrimaryColor1
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Large ?Icon(Icons.circle,color: Colors.black,):
                                  Icon(Icons.circle_outlined),
                                  SizedBox(width: 5,),
                                  Text('Large'),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18,top: 3),
                                child: Text('21.00 CAD',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
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
                Text("Add Food Image",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    _showPicker(context, 1); // Move setState outside because it's not needed for triggering _showPicker
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Appcolor.PrimaryColor1,
                        border: Border.all(color: Colors.black12)
                    ),
                    child: Center(child:  _image != null
                        ? Image.file(_image!, fit: BoxFit.cover):
                    SvgPicture.asset('assets/go.svg')),
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
                  keyboardType: TextInputType.number,
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
                    child: Center(child: Text('Add food',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                  ),
                ),
        // ]
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
