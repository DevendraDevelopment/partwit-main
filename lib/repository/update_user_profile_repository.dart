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
import 'package:part_wit/model/ModelRegister.dart';
import 'package:part_wit/model/ModelUserUpdateData.dart';
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constaint.dart';

import '../repository/user_repository.dart' as userRepo;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ModeRegister> createUserUpdateData(File fill, String name,
    BuildContext context) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse(ApiUrls.updateUserData);
  var request = http.MultipartRequest(
    "POST",
    url,
  );
  //add text fields
  SharedPreferences pref = await SharedPreferences.getInstance();
  var user = ModeRegister.fromJson(jsonDecode(pref.getString('user')!));
  request.headers["Authorization"] =
      "Bearer " + user.token;
  request.fields["name"] = name;
  if (fill.path.isEmpty) {
    //
    // request.files.add(http.MultipartFile('profile_pic',
    //     File("").readAsBytes().asStream(), File("").lengthSync(),
    //     filename: fill.path
    //         .split("/")
    //         .last));
  } else {
    request.files.add(http.MultipartFile('profile_pic',
        File(fill.path).readAsBytes().asStream(), File(fill.path).lengthSync(),
        filename: fill.path
            .split("/")
            .last));
  }
  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  // Helpers.createSnackBar(context, "Res 3 : " + responseString.toString());
  if ((response.statusCode) == 200) {
    Helpers.hideLoader(loader);
    // Helpers.createSnackBar(context, "Res 22: "+json.decode(responseString)['status']);
    // bool status;
    // status = json.decode(responseString)['status'];
    // String mess;
    // mess = json.decode(responseString)['message'];
    // if (status == true) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString("id", json.decode(response.body)['user_info']['id'].toString());
      String user = jsonEncode(ModeRegister.fromJson(jsonDecode(responseString)));
      pref.setString('user', user);
      return ModeRegister.fromJson(json.decode(responseString));
    // } else {
    //   Helpers.createSnackBar(context, "Else");
    // }
  } else {
    Helpers.createSnackBar(context, "Exception : ");
    throw Exception(responseString);
  }
  return ModeRegister.fromJson(json.decode(responseString));
}
