import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'BaseUrl.dart';


class HttpService {
  // static String postsURL = "http://dev.codemeg.com/nazza/public/api/";

  /// -------------------- Login -------------------- ///

  static Future<dynamic> login(
      String mobile,countryCode, deviceType, deviceToken, lang) async {
    Map data = {
      'mobile': mobile,
      'countryCode': countryCode,
      // 'device_type': deviceType,
      // 'device_token': deviceToken,
      // 'lang': lang,
    };

    String body = json.encode(data);
    debugPrint(body);
    var url = BaseUrl.signup;
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        // "accept": "application/json",
        // "Access-Control-Allow-Origin": "*"
      },
    );
    debugPrint(response.body);
    // print(response.statusCode);

    return response;
  }



  /// -------------------- register -------------------- ///

  static Future<dynamic> register(
      var url,
      String name,
      email,
      gender,
      address,
      city,
      state,
      phone,
      CPF,
      specialty_en,
      specialty_pt,
      lat,
      lng,
      password,
      confirm_password,
      device_type,
      device_token,
      lang,
      var files) async {
    Map<dynamic, dynamic> headers = {
      // "Accept": "application/json",
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    // request.headers.addAll(headers);
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['gender'] = gender;
    request.fields['address'] = address;
    request.fields['state'] = state;
    request.fields['city'] = city;
    request.fields['phone'] = phone;
    request.fields['CPF'] = CPF;
    request.fields['specialty_en'] = specialty_en;
    request.fields['specialty_pt'] = specialty_pt;
    request.fields['lat'] = lat;
    request.fields['lng'] = lng;
    request.fields['password'] = password;
    request.fields['confirm_password'] = confirm_password;
    request.fields['device_type'] = device_type;
    request.fields['device_token'] = device_token;
    request.fields['lang'] = lang;

    /*if (partParams != null) {
      request.fields.addAll(partParams);
    } */ // add part params if not null
    if (files != null) request.files.addAll(files); // add files if not null

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint("responseBody " + responseString);
    if (response.statusCode == 200) {}
    return responseString;
  }

  /// -------------------- Otp verify -------------------- ///

  static Future<dynamic> otpVerify(String phone,countryCode, otp, lang) async {
    var map = {};
    map['mobile'] = phone;
    map['countryCode'] = countryCode;
    map['otp'] = otp;
    // map['lang'] = lang;

    String body = json.encode(map);
    debugPrint(body);
    var url = BaseUrl.verifyOtp;
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        // "accept": "application/json",
        // "Access-Control-Allow-Origin": "*"
      },
    );
    debugPrint(response.body);

    return response;
  }

  /// -------------------- resend Otp -------------------- ///

  static Future<dynamic> resendOtp(String phone,countryCode) async {
    Map map = {
      'mobile': phone,
      'countryCode': countryCode,
      // 'device_type': deviceType,
      // 'device_token': deviceToken,
      // 'lang': lang,
    };
    String body = json.encode(map);
    var url = BaseUrl.resendOtp;
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        // "accept": "application/json",
        // "Access-Control-Allow-Origin": "*"
      },
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      debugPrint('success');
    }
    return response;
  }




  /// -------------------- add Suggestion -------------------- ///


  static Future<dynamic> updateProfileImg(
      var url,
      String userId,
      var files) async {
    Map<dynamic, dynamic> headers = {
      // "Accept": "application/json",
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    // request.headers.addAll(headers);
    request.fields['userId'] = userId;


    if (files != null) request.files.addAll(files); // add files if not null

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint("responseBody $responseString");
    if (response.statusCode == 200) {}
    return responseString;
  }

  /// -------------------- update User -------------------- ///

  static Future<dynamic> updateUser(String userId ,name,email,mobile,address) async {
    Map map = {
      'userId': userId,
      'name': name,
      'email': email,
      'mobile': mobile,
      'address': address,
    };
    String body = json.encode(map);
    debugPrint(body);
    var url = BaseUrl.updateUser;
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        // "accept": "application/json",
        // "Access-Control-Allow-Origin": "*"
      },
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      debugPrint('success');
    }
    return response;
  }


  /// -------------------- send  message -------------------- ///

  static Future<dynamic> chatting(var url, String appointmentId, senderId,
      receiverId, message, lang, var files) async {
    Map<dynamic, dynamic> headers = {
      // "Accept": "application/json",
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    // request.headers.addAll(headers);
    request.fields['appointment_id'] = appointmentId;
    request.fields['sender_id'] = senderId;
    request.fields['receiver_id'] = receiverId;
    request.fields['message'] = message;
    request.fields['lang'] = lang;

    /*if (partParams != null) {
      request.fields.addAll(partParams);
    } */ // add part params if not null
    if (files != null) request.files.addAll(files); // add files if not null

    var response = await request.send();
    print("request " + request.toString());
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("responseBody " + responseString);
    if (response.statusCode == 200) {}
    return responseString;
  }


  /// ---------------------- Get Apis ---------------------- ///

  /// ---------------------- Get Category ---------------------- ///

  // static Future getCategory(String limit,String offset) {
  //   var url = BaseUrl.getCategories/*+"limit="+limit+"&offset="+offset*/;
  //   debugPrint("url = $url");
  //   return http.get(Uri.parse(url));
  // }




  // static Future getPlaces(String location,String radius,String keyword,String key) {
  //   var url = BaseUrl.googleUrl+"location="+location+"&radius="+radius+"&keyword="+keyword+"&key="+key;
  //   debugPrint("url = $url");
  //   return http.get(Uri.parse(url));
  // }





}