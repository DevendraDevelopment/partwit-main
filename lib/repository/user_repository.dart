import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:part_wit/model/LoginModel.dart';
import 'package:part_wit/model/ModelRegister.dart';
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constaint.dart';

import '../repository/user_repository.dart' as userRepo;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ModeRegister> createLogin(
    String email, String password, BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
    url = Uri.parse(ApiUrls.loginUrl);
  var map = new Map<String, dynamic>();
  map['email'] = email;
  map['password'] = password;
  map['device_id'] = '1476402def040d58';
  map['role'] = '2';
  http.Response response = await http.post(
    url,
    body: map,
  );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(response.body)['status'];
    if(status==true){
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
      SharedPreferences prefs1 = await SharedPreferences.getInstance();
      prefs1.setString("id", json.decode(response.body)['user_info']['id'].toString());
      return ModeRegister.fromJson(json.decode(response.body));
    } else{
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    }

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw Exception(response.body);

  }
  return ModeRegister.fromJson(json.decode(response.body));
}
