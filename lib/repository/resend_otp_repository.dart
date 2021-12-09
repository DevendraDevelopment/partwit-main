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
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constaint.dart';

import '../repository/user_repository.dart' as userRepo;
import 'package:http_parser/http_parser.dart';

Future<CommonResponse> createResendOtp(
    String type,String email,BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.resendEmailVerificationOtp);
  var map = new Map<String, dynamic>();
  map['email'] = email;
  map['type'] = type;
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
