
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodoo/Constant/Appcolor.dart';
import 'package:foodoo/Screens/Add_Shop_Details.dart';
import 'package:foodoo/Screens/Login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _number = TextEditingController();


  Future<void> _saveProfileData(String name, String email, String number) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('number', number);
    print("Data saved to SharedPreferences");
  }

  late bool isLg = false;

  String mobileStrWithCode = "+91"; // Example country code
  String firebaseToken = "YOUR_FIREBASE_TOKEN"; // Example Firebase token
  String lat = "0.0"; // Example latitude
  String lon = "0.0"; // Example longitude


  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    _name.clear();
    _lastname.clear();
    _email.clear();
    _password.clear();
    _number.clear();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          title: Text("Register",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          leading: CircleAvatar(
              radius: 10,
              backgroundColor: Appcolor.PrimaryColor1,
              child: Icon(Icons.arrow_back))
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter Full name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter your name",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Last name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _lastname,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter last name",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Enter Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Email",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                      onSaved: (val) {
                        //  phone = val;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a email';
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Enter Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Password",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Text("Enter Confirm Password",
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextField(
                  //   controller: _cpassword,
                  //   decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.all(7),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(7)
                  //       ),
                  //       hintText: "Enter Confirm Password",
                  //       filled: true,
                  //       fillColor: Appcolor.PrimaryColor1
                  //   ),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Enter Contact number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10), // Restrict input to 10 characters
                      FilteringTextInputFormatter.digitsOnly, // Allow only digits
                    ],
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter your number",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_signUpFormKey.currentState?.validate() ?? false)
                      register();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Appcolor.PrimaryColor
                      ),
                      child: Center(child: Text('Register', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),),
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Login(),));
                          },
                          child: Text('Sign in', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Appcolor.PrimaryColor),))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> register() async {
   // const String url = "https://techimmense.in/foodoo/webservice/signup";
    if (_number.text.isEmpty ||
        _name.text.isEmpty ||
        _lastname.text.isEmpty ||
        _email.text.isEmpty ||
        _password.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "All fields are required",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    Map<String, String> paramdata = {
      "mobile": _number.text,
      "mobile_with_code": mobileStrWithCode,
      "first_name": _name.text,
      "last_name": _lastname.text,
      "email": _email.text,
      "password": _password.text,
      "register_id": firebaseToken,
      "ios_register_id": "",
      "type": "PROVIDER",
      "signup_referral_code": "",
      "address": "",
      "lat": lat,
      "lon": lon,
    };

    try {
      final response = await http.post(
        Uri.parse("https://techimmense.in/foodoo/webservice/signup"),
        body: paramdata,
      );

      if (response.statusCode == 200) {
        var Data = jsonDecode(response.body);
        print(Data['message']);
        print(Data['status']);
        print("Registration successful");
        Fluttertoast.showToast(
          msg: "Registration successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        await _saveProfileData(
          _name.text,
          _email.text,
          _number.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Add_Shop_Details()),
        );
      } else {
        print("Registration failed with status: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed")),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred")),
      );
    }
  }

}
