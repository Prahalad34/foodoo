import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodoo/Constant/Appcolor.dart';
import 'package:foodoo/Screens/Home1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import 'Add_location.dart';
class Add_Shop_Details extends StatefulWidget {
  const Add_Shop_Details({super.key});

  @override
  State<Add_Shop_Details> createState() => _Add_Shop_DetailsState();
}

class _Add_Shop_DetailsState extends State<Add_Shop_Details> {


  TextEditingController _shopname = TextEditingController();
  TextEditingController _Email = TextEditingController();
  TextEditingController _PhoneNumber = TextEditingController();
  TextEditingController _StreetAddress = TextEditingController();
  TextEditingController _PostCode = TextEditingController();
  TextEditingController _Country = TextEditingController();
  TextEditingController _OperatingHours = TextEditingController();
  TextEditingController _Description = TextEditingController();
  TextEditingController _SocialMediaLinks = TextEditingController();
  TextEditingController _SelectCategory = TextEditingController();
  TextEditingController _DeliveryOptions = TextEditingController();
  TextEditingController _RestaurantLogo = TextEditingController();

  String dropdownValue = 'A';


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


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            title: Text("Add Shop Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shop name", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _shopname,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter shop name",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Email", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _Email,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Email",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Phone Number", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _PhoneNumber,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Number",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Street Address", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _StreetAddress,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Street Address",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Post Code", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _PostCode,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Post Code",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Country", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _Country,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Country",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Operating Hours", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _OperatingHours,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Operating Hours",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Description", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _Description,
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
                  Text("Social Media Links", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _SocialMediaLinks,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Social Media Links",
                        filled: true,
                        fillColor: Appcolor.PrimaryColor1
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Select Category", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1,
                      contentPadding: const EdgeInsets.all(7),
                    ),
                    dropdownColor: Colors.white,
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['A', 'B', "C", "D"].map<
                        DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Delivery Options", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      filled: true,
                      fillColor: Appcolor.PrimaryColor1,
                      contentPadding: const EdgeInsets.all(7),
                    ),
                    dropdownColor: Colors.white,
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['A', 'B', "C", "D"].map<
                        DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Restaurant Logo", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      _showPicker(context,
                          1); // Move setState outside because it's not needed for triggering _showPicker
                    },
                    child: Container(
                      height: 100,
                      // width: 100, // Add width to ensure the container has a defined size
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Appcolor.PrimaryColor1,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Center(
                        child: _image != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(_image!, fit: BoxFit.cover,
                              width: 100,
                              height: 100),
                        )
                            : SvgPicture.asset('assets/go.svg', fit: BoxFit
                            .cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_image != null) {
                        uploadImage(_image!);
                      } else {
                        print("No image selected");
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Appcolor.PrimaryColor
                      ),
                      child: Center(child: Text('Add', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    ));
  }

  Future<void> uploadImage(File image) async {
    final Uri apiUrl = Uri.parse('https://techimmense.in/foodoo/webservice/update_provider_profile');

    // Determine the mime type of the file
    final mimeTypeData = lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])?.split('/') ?? ['image', 'png'];

    // Create a multipart request
    final request = http.MultipartRequest('POST', apiUrl);

    // Attach the file in the request
    final file = await http.MultipartFile.fromPath(
      'file',
      image.path,
      contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
    );

    // Add the fields to the request
    request.fields['provider_name'] = _shopname.text;
    request.fields['user_id'] = '14'; // Add the correct user_id
    request.fields['provider_email'] = _Email.text;
    request.fields['provider_mobile'] = _PhoneNumber.text;
    request.fields['provider_streat_address'] = _StreetAddress.text;
    request.fields['provider_post_code'] = _PostCode.text;
    request.fields['delivery_option'] = _DeliveryOptions.text;
    request.fields['provider_country'] = _Country.text;
    request.fields['provider_country_id'] = ''; // Add the correct country_id
    request.fields['facebook_url'] = ''; // Add the correct facebook_url
    request.fields['instagram_url'] = ''; // Add the correct instagram_url
    request.fields['description'] = _Description.text;
    request.fields['provider_lat'] = ''; // Add the correct latitude
    request.fields['provider_lon'] = ''; // Add the correct longitude
    request.fields['radius'] = ''; // Add the correct radius
    // Print the fields being sent
    print('Request Fields: ${request.fields}');

    // Attach the file to the request
    request.files.add(file);

    // Print the file details
    print('File Details: ${file.field}, ${file.filename}, ${file.length}');

    try {
      // Send the request to the server
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Upload successful: $responseData');
        Fluttertoast.showToast(
          msg: responseData['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => Add_location(),));
      } else {
        print('Upload failed: ${response.reasonPhrase}');
        Fluttertoast.showToast(
          msg: "Upload failed: ${response.reasonPhrase}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      print('Error occurred while uploading: $e');
      Fluttertoast.showToast(
        msg: "Error occurred while uploading: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}