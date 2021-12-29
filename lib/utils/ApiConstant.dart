import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:part_wit/model/ModelRegister.dart';

class ApiUrls {
  static const String apiBaseUrl = 'http://partwit.inditechitsolution.com/api/';
  static const String loginUrl = apiBaseUrl + "login";
  static const String registerUrl = apiBaseUrl + "register";
  static const String sendVerificationOtp = apiBaseUrl + "send-verification-otp";
  static const String socialLoginUrl = apiBaseUrl + "social-login";
  static const String logoutUrl = apiBaseUrl + "logout";
  static const String verifyUserEmailOtpUrl = apiBaseUrl + "verify-user-email-otp";
  static const String resendEmailVerificationOtpUrl = apiBaseUrl + "resend-email-verification-otp";
  static const String sendForgotPasswordOtpMailUrl = apiBaseUrl + "send-forgot-password-otp-mail";
  static const String changeForgetPasswordUrl = apiBaseUrl + "change-forget-password";
  static const String updateUserDataUrl = apiBaseUrl + "update-user-data";
  static const String sendForgotPasswordOtpMail = apiBaseUrl + "send-forgot-password-otp-mail";
  static const String resendEmailVerificationOtp = apiBaseUrl + "resend-email-verification-otp";
  static const String updateUserData = apiBaseUrl + "v1/update-user-data";
  static const String verifyForgetPasswordOtp = apiBaseUrl + "verify-forget-password-otp";
  static const String verifyChangePassword= apiBaseUrl + "v1/change-password";
}

logPrint(String logis) {
  log(logis);
}

ModeRegister? loginAndRegistrationresponse;

messageToastFalse(BuildContext context, String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 12.0);
}

messageToastTrue(BuildContext context, String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 12.0);
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}
Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}
