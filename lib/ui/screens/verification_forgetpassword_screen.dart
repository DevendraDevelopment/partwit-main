import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:part_wit/repository/resend_otp_repository.dart';
import 'package:part_wit/repository/verify_forget_password_otp.dart';
import 'package:part_wit/repository/verify_user_email_otp.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_body_underline.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/utility.dart';

import 'package:pinput/pin_put/pin_put.dart';

class VerificationForgetPasswordScreen extends StatefulWidget {
  String otptyp, email;
  VerificationForgetPasswordScreen(String this.email,String this.otptyp) : super();

  @override
  State<VerificationForgetPasswordScreen> createState() => _VerificationForgetPasswordScreenState(email,otptyp);
}

class _VerificationForgetPasswordScreenState extends State<VerificationForgetPasswordScreen> {
  final verification_formKey = GlobalKey<FormState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  String otptyp, email;
  _VerificationForgetPasswordScreenState(String this.email,String this.otptyp);

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
   // String email = verificationtype[""];
    //String type = verificationtype[""];
    final Object? rcvdData = ModalRoute.of(context)!.settings.arguments;

    print("rcvd fdata ${rcvdData}");

    return GestureDetector(
      onTap: () {
        ///hide keyboard function
        Utility.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: MyAppTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: verification_formKey,
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
                const LightTextBody(
                  data: Constant.SEND_VERIFICATION,
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
                              fontWeight: FontWeight.bold
                          ),
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
                          if (verification_formKey.currentState!.validate()) {
                            FocusScope.of(this.context).requestFocus(FocusNode());
                            Helpers.verifyInternet().then((intenet) {
                              if (intenet != null && intenet) {
                                Get.toNamed(MyRouter.resetNewPasswordScreen,
                                    arguments: email);
                               /* createVerifyForgetPasswordOtp(_pinPutController.text,context)
                                    .then((response) {
                                  setState(() {
                                    if(response.status==true){
                                      Get.toNamed(MyRouter.resetNewPasswordScreen,
                                          arguments: Constant.PASS_VALUE);
                                    }
                                  });
                                });*/
                              } else {
                                Helpers.createSnackBar(context, "Please check your internet connection");
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
                ResendOtpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell ResendOtpButton() {
    return InkWell(
                onTap: (){
                  Helpers.verifyInternet().then((intenet) {
                    if (intenet != null && intenet) {
                      createResendOtp(otptyp,email,context)
                          .then((response) {
                        setState(() {
                          if(response.status==true){
                           // Get.toNamed(MyRouter.createProfile,
                             //   arguments: Constant.PASS_VALUE);
                          }
                        });
                      });
                    } else {
                      Helpers.createSnackBar(context, "Please check your internet connection");
                    }
                  });
                },
                child: LightTextBodyBlack(
                  data: Constant.RESEND_CODE,
                ),
              );
  }
}
