import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:part_wit/repository/verify_reset_password.dart';
import 'package:part_wit/ui/screens/signup_screen.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utils/Helpers.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:part_wit/utils/utility.dart';
import 'package:get/get_core/src/get_main.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldPassFormKey = GlobalKey<FormState>();
  bool _showOldPassword = false,
      _showPassword = false,
      _showConfirmPassword = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _confrimpasswordController =
      TextEditingController();

  FocusNode passWordFocus = FocusNode();
  FocusNode oldPassWordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

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
        Utility.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyAppTheme.backgroundColor,
          brightness: Brightness.dark,
          centerTitle: true,
          title: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            child: Image.asset(MyImages.ic_app_logo),
          ),
          leading: Builder(
            builder: (context) => IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
                onPressed: () => {Get.back()}),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: oldPassFormKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  const LightTextHead(
                    data: Constant.CHANGEPASSWORD,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    controller: _oldController,
                    obscureText: !_showOldPassword,
                    focusNode: oldPassWordFocus,
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
                      fillColor: MyAppTheme.txtShadow_Color,
                      hintText: Constant.USER_OLDPASSWORD,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: MyAppTheme.txtShadow_Color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyAppTheme.txtShadow_Color),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyAppTheme.txtShadow_Color, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                      suffixIcon: IconButton(
                        icon: _showOldPassword
                            ? const ImageIcon(AssetImage(MyImages.ic_eye_open))
                            : const ImageIcon(AssetImage(MyImages.ic_eye_close)),
                        onPressed: () {
                          setState(() => _showOldPassword = !_showOldPassword);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    controller: _passwordController,
                    obscureText: !this._showPassword,
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
                      fillColor: MyAppTheme.txtShadow_Color,
                      hintText: Constant.USER_PASSWORD,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: MyAppTheme.txtShadow_Color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyAppTheme.txtShadow_Color),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyAppTheme.txtShadow_Color, width: 2.0),
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
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    controller: _confrimpasswordController,
                    obscureText: !this._showConfirmPassword,
                    focusNode: confirmPasswordFocus,
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
                      fillColor: MyAppTheme.txtShadow_Color,
                      hintText: Constant.CONFIRM_PSW,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: MyAppTheme.txtShadow_Color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyAppTheme.txtShadow_Color),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyAppTheme.txtShadow_Color, width: 2.0),
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
                          Constant.UPDATE,
                          54,
                          onPressed: () {
                            if (oldPassFormKey.currentState!.validate()) {
                              FocusScope.of(this.context)
                                  .requestFocus(FocusNode());
                              if (_passwordController.text ==
                                  _confrimpasswordController.text) {
                                createOldPassword(
                                        _oldController.text,
                                        _passwordController.text,
                                        _confrimpasswordController.text,
                                        context)
                                    .then((response) {
                                  setState(() {
                                    if (response.status == true) {
                                      Navigator.pop(context);
                                    }
                                  });
                                });
                              } else {
                                Helpers.createSnackBar(
                                    context, "Your Password Don't Match");
                              }
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
      ),
    );
  }
}
