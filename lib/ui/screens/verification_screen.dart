import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:part_wit/repository/resend_otp_repository.dart';
import 'package:part_wit/repository/verify_user_email_otp.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/screens/create_profile_screen.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/custom_checkbox.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_body_underline.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utils/Helpers.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:part_wit/utils/utility.dart';

import 'package:pinput/pin_put/pin_put.dart';

class VerificationScreen extends StatefulWidget {
  String otpType, password, email;

  VerificationScreen(String this.email, String this.password, String this.otpType) : super();

  @override
  State<VerificationScreen> createState() =>
      _VerificationScreenState(email, password, otpType);
}

class _VerificationScreenState extends State<VerificationScreen> {
  final verification_formKey = GlobalKey<FormState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  String otpType, email, password;
  bool _isAgreeCheckBox = true;

  _VerificationScreenState(String this.email, String this.password, String this.otpType);

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
    // final screenHeight = MediaQuery.of(context).size.height;
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
                  data: Constant.STEPVERIFICATION,
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
                            screenWidth * 0.150, 0, screenWidth * 0.150, 0),
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
                        height: screenSize.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _isAgreeCheckBox = !_isAgreeCheckBox;
                                });
                              },
                              child: Container(
                                child: _isAgreeCheckBox
                                    ? Container(
                                    height: 20,
                                    width: 20,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Container(
                                        color: MyAppTheme.pin_bg_Color,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(
                                              MyImages.ic_checked,
                                              height: 12,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ))
                                    : Container(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Image.asset(MyImages.ic_unchecked,
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.fill),
                                ),
                              )),
                          SizedBox(
                            width: screenSize.height * 0.001,
                          ),
                          const LightTextBody(data: Constant.DONT),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
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
                            FocusScope.of(this.context)
                                .requestFocus(FocusNode());
                            Helpers.verifyInternet().then((intenet) {
                              if (intenet != null && intenet) {
                                createVerifyUserEmailOtp(
                                        _pinPutController.text,email, context)
                                    .then((response) {
                                  setState(() {
                                    if (response.status == true) {
                                      // Get.toNamed(MyRouter.createProfile);
                                      // Navigator.pushReplacementNamed(context, MyRouter.createProfile);

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CreateProfile(email, password)),
                                      );
                                    } else {
                                      //  Get.toNamed(MyRouter.createProfile);
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
      onTap: () {
        Helpers.verifyInternet().then((intenet) {
          if (intenet != null && intenet) {
            createResendOtp(otpType, email, context).then((response) {
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
      child: LightTextBodyBlack(
        data: Constant.RESEND_CODE,
      ),
    );
  }
}
