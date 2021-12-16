import 'package:flutter/material.dart';
import 'package:part_wit/repository/resend_otp_repository.dart';
import 'package:part_wit/repository/verify_forget_password_otp.dart';
import 'package:part_wit/ui/screens/reset_new_password.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_body_underline.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utils/Helpers.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:part_wit/utils/utility.dart';

import 'package:pinput/pin_put/pin_put.dart';

class VerificationForgetPasswordScreen extends StatefulWidget {
  String otptyp, email;

  VerificationForgetPasswordScreen(String this.email, this.otptyp)
      : super();

  @override
  State<VerificationForgetPasswordScreen> createState() =>
      _VerificationForgetPasswordScreenState(email, otptyp);
}

class _VerificationForgetPasswordScreenState
    extends State<VerificationForgetPasswordScreen> {
  final verificationFormKey = GlobalKey<FormState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  String otpTyp, email;

  _VerificationForgetPasswordScreenState(this.email, this.otpTyp);

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: MyAppTheme.pin_bg_Color),
      borderRadius: BorderRadius.circular(5.0),
      color: MyAppTheme.pin_bg_Color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final Object? rcvdData = ModalRoute.of(context)!.settings.arguments;

    return GestureDetector(
      onTap: () {
        Utility.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: MyAppTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: verificationFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.10,
                ),
                Center(
                  child: Image.asset(MyImages.ic_app_logo),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                const LightTextHead(
                  data: Constant.VERIFICATION,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                const LightTextBody(
                  data: Constant.ENTER_VERIFICATION,
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                LightTextBody(
                  data: Constant.SEND_VERIFICATION + email,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth > 600 ? screenWidth * 0.2 : 16),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            screenWidth * 0.050, 0, screenWidth * 0.050, 0),
                        color: MyAppTheme.backgroundColor,
                        child: PinPut(
                          fieldsCount: 4,
                          //onSubmit: (String pin) => _showSnackBar(pin, context),
                          focusNode: _pinPutFocusNode,
                          controller: _pinPutController,
                          cursorColor: MyAppTheme.whiteColor,
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: MyAppTheme.textPrimary,
                              fontWeight: FontWeight.bold),
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          selectedFieldDecoration: _pinPutDecoration,
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CustomButton(
                        Constant.SUBMIT,
                        54,
                        onPressed: () {
                          if (verificationFormKey.currentState!.validate()) {
                            FocusScope.of(this.context)
                                .requestFocus(FocusNode());
                            Helpers.verifyInternet().then((intenet) {
                              if (intenet) {
                                createVerifyForgetPasswordOtp(
                                        _pinPutController.text, context)
                                    .then((response) {
                                  setState(() {
                                    if (response.status == true) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResetNewPassword(
                                                  email: email,
                                                )),
                                      );
                                    }
                                  });
                                });
                              } else {
                                Helpers.createSnackBar(context,
                                    "Please check your internet connection");
                              }
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                const LightTextBody(
                  data: Constant.DONT_RECEIVE,
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                resendOtpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell resendOtpButton() {
    return InkWell(
      onTap: () {
        Helpers.verifyInternet().then((intenet) {
          if (intenet) {
            createResendOtp(otpTyp, email, context).then((response) {
              setState(() {
                if (response.status == true) {
                  // Get.toNamed(MyRouter.createProfile,
                  //   arguments: Constant.PASS_VALUE);
                }
              });
            });
          } else {
            Helpers.createSnackBar(
                context, "Please check your internet connection");
          }
        });
      },
      child: const LightTextBodyBlack(
        data: Constant.RESEND_CODE,
      ),
    );
  }
}
