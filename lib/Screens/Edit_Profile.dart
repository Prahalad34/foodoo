import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/Appcolor.dart';
class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {


  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  var isLength = 0;

  File? _image;

  var imageURL = '';

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

  Future<void> _updateProfile() async {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty || _phoneController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    var request = http.MultipartRequest('POST', Uri.parse('https://techimmense.in/foodoo/webservice/update_profile'));
    request.fields['name'] = _nameController.text;
    request.fields['email'] = _emailController.text;
    request.fields['phone'] = _phoneController.text;
    request.fields['password'] = _passwordController.text;
    request.fields['user_id'] = '';
    request.fields['token'] = '';
    request.fields['lat'] = '';
    request.fields['lon'] = '';


    if (_image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'profile_image',
          _image!.path,
        ),
      );
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var json = jsonDecode(responseData);
        Fluttertoast.showToast(
          msg: 'profile update successfull',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        if (json['status'] == 'true') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Profile updated successfully")),
          );
          await _saveProfileData(
            _nameController.text,
            _emailController.text,
            _phoneController.text,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(json['message'])),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update profile")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred")),
      );
    }
  }

  String? _savedName;
  String? _savedEmail;
  String? _savedNumber;

  @override
  void initState() {
    super.initState();
    _retrieveProfileData();
  }

  Future<void> _retrieveProfileData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('name')) {
      setState(() {
        _savedName = prefs.getString('name');
        _nameController.text = _savedName ?? '';
      });
    }

    if (prefs.containsKey('email')) {
      setState(() {
        _savedEmail = prefs.getString('email');
        _emailController.text = _savedEmail ?? '';
      });
    }

    if (prefs.containsKey('number')) {
      setState(() {
        _savedNumber = prefs.getString('number');
        _phoneController.text = _savedNumber ?? '';
      });
    }
  }

  Future<void> _saveProfileData(String name, String email, String number) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('number', number);
    print("Data saved to SharedPreferences");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
                InkWell(
                    onTap : ()=> _showPicker(context, 1),
                    child: CircleAvatar(
                      radius: 40,
                      child: ClipOval(
                        child: _image == null && imageURL.isEmpty
                            ? Image.network(
                          'https://picsum.photos/seed/picsum/200/300',
                          fit: BoxFit.cover,
                          width: 160,
                          height: 160,
                        )
                            : _image != null
                            ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: 160,
                          height: 160,
                        )
                            : Image.network(
                          imageURL,
                          fit: BoxFit.cover,
                          width: 160,
                          height: 160,
                        ),
                      ),
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Edit Shop",style: TextStyle(fontWeight: FontWeight.bold),),
                    Icon(Icons.create)
                  ],
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0
                      )
                    ),
                    hintText: "John Roi",
                    filled: true,
                    fillColor: Appcolor.PrimaryColor1
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              style: BorderStyle.none,
                              width: 0
                          )
                      ),
                      hintText: "Johnroi@gmail.com",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                ),
                SizedBox(height: 15,),
                IntlPhoneField(
                  controller: _phoneController,
                  flagsButtonPadding: const EdgeInsets.all(4),
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Appcolor.PrimaryColor1,
                    counterText: "",
                    contentPadding: const EdgeInsets.all(7),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    setState(() {
                      isLength = phone.number.length;
                      print(phone.completeNumber);
                    });
                  },
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              style: BorderStyle.none,
                              width: 0
                          )
                      ),
                      hintText: "****************",
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: (){
                    _updateProfile();
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => Home1(),));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Appcolor.PrimaryColor
                    ),
                    child: Center(child: Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
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