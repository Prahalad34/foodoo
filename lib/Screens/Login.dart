
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodoo/Screens/Forget_Password.dart';
import 'package:foodoo/Screens/Home1.dart';
import 'package:foodoo/Screens/Register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/Appcolor.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  String lat = "0.0"; // Example latitude
  String lon = "0.0"; //
  String firebaseToken = "YOUR_FIREBASE_TOKEN"; //

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  bool passwordVisible=false;
  bool _isLoading = false; // Loading state variable

  @override
  void initState() {
    _email.clear();
    _password.clear();
    super.initState();
    passwordVisible=true;
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  String? _userId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          title: const Text("Login",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          leading: const CircleAvatar(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text("Enter Email", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)
                          ),
                          hintText: "Enter your Email",
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Enter Password", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter your Password",
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
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
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Forget_Password(),));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 215),
                      child: Text("Forget Password",textAlign: TextAlign.end,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_signUpFormKey.currentState?.validate() ?? false)
                        login();
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home1(),));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Appcolor.PrimaryColor
                      ),
                      child: Center(
                        child:_isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                           : const Text('Login', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don’t have an account?', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),),
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const Register(),));
                          },
                          child: const Text('Register', style: TextStyle(
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
  Future<void> login() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
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
      "email": _email.text,
      "password": _password.text,
      "user_id": 'userId',
    };
    setState(() {
      _isLoading = true; // Show loader
    });

    try {
      final response = await http.post(
        Uri.parse("https://techimmense.in/foodoo/webservice/login"),
        body: paramdata,
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        print("Response Data: $responseData");

        if (responseData['status'] == "1") { // Check for "1" instead of true
          // Save session data if needed
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('email', _email.text);
          await prefs.setString('password', _password.text);
          await prefs.setString('user_id', 'userId');
          //await prefs.setString('token', responseData['token']);

          // Login successful, navigate to Home1
          Fluttertoast.showToast(
            msg: responseData['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Home1(
                    email: _email.text.trim(),
                    password: _password.text.trim(),
                  ),
            ),
          );
        } else {
          // Login failed, show the error message
          Fluttertoast.showToast(
            msg: responseData['message'],
            // Display the error message from server
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        print("Login failed with status: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed")),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred")),
      );

    } finally {
      setState(() {
        _isLoading = false; // Hide loader
      });
    }
  }
}
