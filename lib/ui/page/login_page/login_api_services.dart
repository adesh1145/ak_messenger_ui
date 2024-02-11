// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import '../../page/chat/chat_list.dart';
import '../../page/otp/otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Uri urlToUri(String route) {
  String url = "http://10.0.2.2:8000/api/user/$route";
  Uri uri = Uri.parse(url);
  return uri;
}

Map<String, dynamic> responseData = {};
Future<void> fetchUser(email, password) async {
  var obj = {'email': email, 'password': password};
  String jsonDataEncoded = json.encode(obj);
  var url = urlToUri("login/");
  var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonDataEncoded);
  var body = response.body;
  var jsonDataDecoded = jsonDecode(body);
  if (response.statusCode == 200) {
    responseData = jsonDataDecoded;
  } else if (response.statusCode == 404) {
    responseData = jsonDataDecoded;
  }
}

Future<void> action(context, email, password) async {
  await fetchUser(email, password);

  if (responseData['link'] == 'otp/') {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpPageUi(email: email, password: password)));
  } else if (responseData['access'] != null) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChatListPageUi(),
        ));
  }
}
