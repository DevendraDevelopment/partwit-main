import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_body_underline.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/utility.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final forgot_Key = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  FocusNode emailFocus = new FocusNode();
  bool _isEmailFocus = false;

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyAppTheme.backgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        ///hide keyboard function
        Utility.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: MyAppTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: forgot_Key,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.10,
                ),
                Center(
                  child: Image.asset(MyImages.ic_app_logo),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                const LightTextHead(
                  data: Constant.FORGOT_PSW,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                const LightTextBody(data: Constant.EMAIL_TEXT),
                const LightTextBody(data: Constant.EMAIL_TEXT1),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 60, 40, 10),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    obscureText: false,
                    focusNode: emailFocus,
                    controller: _emailController,
                    onTap: () {
                      setState(() {
                        _isEmailFocus = true;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email address';
                      } else if (!isEmail(_emailController.text)) {
                        return 'Please enter valid email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: Constant.USER_EMAIL,
                      prefixIcon: Image.asset(MyImages.ic_mail),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: MyAppTheme.buttonShadow_Color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: MyAppTheme.buttonShadow_Color),
                          borderRadius:
                          BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyAppTheme.whiteColor, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CustomButton(
                        Constant.SUBMIT,
                        54,
                        onPressed: () {
                          if (forgot_Key.currentState!.validate()) {
                            _isEmailFocus = false;
                            FocusScope.of(this.context)
                                .requestFocus(FocusNode());
                            try {
                              Get.toNamed(MyRouter.verificationScreen,
                                  arguments: Constant.PASS_VALUE);
                            } on Exception catch (e) {
                              e.printError();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LightTextBody(data: Constant.DONT_HAVE),
                    SizedBox(
                      width: screenSize.height * 0.01,
                    ),
                    const LightTextBodyBlack(
                      data: Constant.SIGNUP_HERE,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}
