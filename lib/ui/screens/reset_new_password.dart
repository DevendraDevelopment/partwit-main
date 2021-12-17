import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:part_wit/repository/verify_reset_password.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/screens/signup_screen.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/ui/widgets/light_text_title.dart';
import 'package:part_wit/utils/Helpers.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:part_wit/utils/utility.dart';
import 'package:get/get_core/src/get_main.dart';

class ResetNewPassword extends StatefulWidget {
  String email;

  ResetNewPassword({Key? key, required this.email}) : super(key: key);

  @override
  _ResetNewPasswordState createState() => _ResetNewPasswordState(email);
}

class _ResetNewPasswordState extends State<ResetNewPassword> {
  final resetPassFormKey = GlobalKey<FormState>();
  bool _showPassword = false, _showConfirmPassword = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  FocusNode passWordFocus = FocusNode();
  FocusNode confrmPassWordFocus = FocusNode();
  String email;

  _ResetNewPasswordState(this.email);

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
            key: resetPassFormKey,
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
                  data: Constant.RESETNEWPASSWORD,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                const LightTextTitle(
                  data: Constant.RESETNEWPASS,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    focusNode: passWordFocus,
                    onTap: () {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Confirm password';
                      } else if (value.length < 7) {
                        return 'Password must be greater then 7';
                      } else if (!validatePassword(value)) {
                        return 'Password must be combination of characters and digits';
                      } else if (value.length > 16) {
                        return 'Password must be less then 16';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIconConstraints:
                          const BoxConstraints(minHeight: 24, minWidth: 24),
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: Constant.USER_PASSWORD,
                      prefixIcon: Image.asset(MyImages.ic_padlock),
                      // suffixIcon: Image.asset(MyImages.ic_eye_close),
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
                              color: MyAppTheme.buttonShadow_Color, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                      suffixIcon: IconButton(
                        icon: _showPassword
                            ? const ImageIcon(AssetImage(MyImages.ic_eye_open))
                            : const ImageIcon(AssetImage(MyImages.ic_eye_close)),
                        onPressed: () {
                          setState(() => _showPassword = !_showPassword);
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    controller: _confirmPasswordController,
                    obscureText: !_showConfirmPassword,
                    focusNode: confrmPassWordFocus,
                    onTap: () {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Confirm password';
                      } else if (value.length < 7) {
                        return 'Password must be greater then 7';
                      } else if (!validatePassword(value)) {
                        return 'Password must be combination of characters and digits';
                      } else if (value.length > 16) {
                        return 'Password must be less then 16';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIconConstraints:
                          const BoxConstraints(minHeight: 44, minWidth: 44),
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: Constant.CONFIRM_PSW,
                      prefixIcon: Image.asset(MyImages.ic_padlock),
                      //suffixIcon: Image.asset(MyImages.ic_eye_open),
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
                              color: MyAppTheme.buttonShadow_Color, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                      suffixIcon: IconButton(
                        icon: _showConfirmPassword
                            ? const ImageIcon(AssetImage(MyImages.ic_eye_open))
                            : const ImageIcon(AssetImage(MyImages.ic_eye_close)),
                        onPressed: () {
                          setState(() =>
                              _showConfirmPassword = !_showConfirmPassword);
                        },
                      ),
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
                          if (resetPassFormKey.currentState!.validate()) {
                            FocusScope.of(this.context)
                                .requestFocus(FocusNode());
                            if (_passwordController.text ==
                                _confirmPasswordController.text) {
                              createResetNewPassword(
                                      email,
                                      _passwordController.text,
                                      _confirmPasswordController.text,
                                      context)
                                  .then((response) {
                                setState(() {
                                  if (response.status == true) {
                                    Get.toNamed(MyRouter.loginScreen,
                                        arguments: Constant.PASS_VALUE);
                                  } else {
                                    Helpers.createSnackBar(
                                        context, "status false");
                                  }
                                });
                              });
                            } else {
                              Helpers.createSnackBar(
                                  context, "Your Password Don't Match");
                            }

                            /* try {
                              Get.toNamed(MyRouter.homeScreen);
                            } on Exception catch (e) {
                              e.printError();
                            }*/
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
