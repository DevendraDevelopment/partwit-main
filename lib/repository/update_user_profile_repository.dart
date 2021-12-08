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
import 'package:part_wit/model/ModelUserUpdateData.dart';
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constaint.dart';

import '../repository/user_repository.dart' as userRepo;
import 'package:http_parser/http_parser.dart';


Future<ModelUserUpdateData> createUserUpdateData(File fill,String name, BuildContext context) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.updateUserData);
  var request = http.MultipartRequest(
    "POST",
    url,
  );
  //add text fields

  request.headers["Authorization"]="Bearer "+loginAndRegistrationresponse!.token;

  request.fields["name"] = name;

  request.files.add(
      http.MultipartFile(
          'profile_pic',
          File(fill.path).readAsBytes().asStream(),
          File(fill.path).lengthSync(),
          filename: fill.path.split("/").last
      )
  );
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  if ((response.statusCode) == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status=json.decode(responseString)['status'];
    String mess;
    mess=json.decode(responseString)['message'];
    if(status==true){
      Helpers.createSnackBar(context, mess);
      return ModelUserUpdateData.fromJson(json.decode(responseString));
    }
    else{
      Helpers.createSnackBar(context, mess);

    }


  } else {

    throw new Exception(responseString);

  }
  return ModelUserUpdateData.fromJson(json.decode(responseString));


}