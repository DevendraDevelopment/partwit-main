import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:part_wit/model/CommonResponse.dart';
import 'package:part_wit/model/LoginModel.dart';
import 'package:part_wit/model/ModelForgotPassword.dart';
import 'package:part_wit/utils/Helpers.dart';
import 'package:part_wit/utils/constaint.dart';

import '../repository/user_repository.dart' as userRepo;
import 'package:http_parser/http_parser.dart';

Future<CommonResponse> createResetNewPassword( String email,
    String pass,String confrmpass,BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.changeForgetPasswordUrl);
  var map = new Map<String, dynamic>();
  map['email'] = email;
  map['password'] = pass;
  map['confirm_password'] = confrmpass;
  http.Response response = await http.post(
    url,
    //headers: {'Authorization':"Bearer "+loginAndRegistrationresponse!.token},
    body: map,
  );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(response.body)['status'];
    if(status==true){
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
      return CommonResponse.fromJson(json.decode(response.body));
    } else{
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    }

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw Exception(response.body);

  }
  return CommonResponse.fromJson(json.decode(response.body));
}
Future<CommonResponse> createOldPassword( String oldpass,
    String pass,String confrmpass,BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.verifyChangePassword);
  var map = new Map<String, dynamic>();
  map['old_password'] = oldpass;
  map['password'] = pass;
  map['confirm_password'] = confrmpass;
  http.Response response = await http.post(
    url,
    headers: {'Authorization':"Bearer "+loginAndRegistrationresponse!.token},
    body: map,
  );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(response.body)['status'];
    if(status==true){
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
      return CommonResponse.fromJson(json.decode(response.body));
    } else{
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    }

  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw Exception(response.body);

  }
  return CommonResponse.fromJson(json.decode(response.body));
}

