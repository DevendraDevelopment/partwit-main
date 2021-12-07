import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:part_wit/model/ModelRegister.dart';
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constaint.dart';

Future<ModeRegister> createRegister(
    String otp, String email, BuildContext context) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  Uri url = Uri.parse(ApiUrls.registerUrl);
  var map = <String, dynamic>{};
  map['otp'] = otp;
  map['email'] = email;
  http.Response response = await http.post(
    url,
    body: map,
  );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    bool status;
    status = json.decode(response.body)['status'];
    if (status == true) {
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
      return ModeRegister.fromJson(json.decode(response.body));
    } else {
      Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    }
  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw Exception(response.body);
  }
  return ModeRegister.fromJson(json.decode(response.body));
}
