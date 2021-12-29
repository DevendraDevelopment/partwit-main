import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:part_wit/model/ModelRegister.dart';
import 'package:part_wit/repository/user_repository.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/screens/home_screen.dart';
import 'package:part_wit/ui/screens/signup_screen.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_body_underline.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utils/Helpers.dart';
import 'package:part_wit/utils/ApiConstant.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:part_wit/utils/utility.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'dart:async';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  bool _showPassword = false,
      _isEmailFocus = false,
      _isPasswordFocus = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passWordFocus = FocusNode();

  bool isLoggedIn = false;
  bool isIOS = false;
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  final _unqKey = UniqueKey();

  //fbUset
  Map _userObj = {};

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '740034809617-kpifjtk2mvnch6i6c92g9tnpr6ljekp3.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  initState() {
    setState(() {
      checkPlatform();
    });
    emailValidCon();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyAppTheme.backgroundColor),
    );

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        print("GOOGLE1" + _currentUser!.email.toString());
      });
    });
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: () {
        ///hide keyboard function
        Utility.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: MyAppTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: loginFormKey,
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
                  data: Constant.USER_LOGIN,
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),

                Form(
                  key: emailFormKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
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
                          _isPasswordFocus = false;
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
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        errorMaxLines: 2,
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    controller: _passwordController,
                    obscureText: !this._showPassword,
                    focusNode: passWordFocus,
                    onTap: () {
                      emailFocus.unfocus();
                      // loginFormKey.currentState!.validate();
                      setState(() {
                        _isEmailFocus = false;
                        _isPasswordFocus = true;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 8) {
                        return 'Password must be greater then 8';
                      } else if (!validatePassword(value)) {
                        return 'Password must be a combination of upper and lower with special char and number';
                      } else if (value.length > 16) {
                        return 'Password must be less then 16';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: Constant.USER_PASSWORD,
                      errorMaxLines: 2,
                      prefixIcon: Image.asset(MyImages.ic_padlock),
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
                            ? ImageIcon(AssetImage(MyImages.ic_eye_open),
                          color: MyAppTheme.passwordIconColor,)
                            : ImageIcon(AssetImage(MyImages.ic_eye_close),
                          color: MyAppTheme.passwordIconColor,),
                        onPressed: () {
                          setState(() => _showPassword = !_showPassword);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                InkWell(
                    onTap: () {
                      try {
                        Get.toNamed(MyRouter.forgotPassword);
                      } on Exception catch (e) {
                        e.printError();
                      }
                    },
                    child: const LightTextBody(data: Constant.FORGOT_PASSWORD)),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CustomButton(
                        Constant.USER_LOGIN,
                        54,
                        onPressed: () {
                          // Get.toNamed(MyRouter.createProfile);
                          if (emailFormKey.currentState!.validate()) {
                            if (loginFormKey.currentState!.validate()) {
                              _isEmailFocus = false;
                              _isPasswordFocus = false;
                              FocusScope.of(this.context)
                                  .requestFocus(FocusNode());
                              Helpers.verifyInternet().then((intenet) {
                                if (intenet != null && intenet) {
                                  createLogin(_emailController.text,
                                      _passwordController.text, context)
                                      .then((response) {
                                    setState(() {
                                      loginData(response);
                                    });
                                  });
                                } else {
                                  Helpers.createSnackBar(context,
                                      "Please check your internet connection");
                                }
                              });
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
                const LightTextBody(data: Constant.ENTER_SOCIAL_MEDIA),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                socialMedialSignIn(screenSize),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const LightTextBody(data: Constant.DONT_HAVE),
                  InkWell(
                    onTap: () {
                      Get.toNamed(MyRouter.signupScreen);
                    },
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(4, 6, 6, 6),
                      child: LightTextBodyBlack(
                        data: Constant.SIGNUP_HERE,
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row socialMedialSignIn(Size screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            FacebookAuth.instance
                .login(permissions: ["public_profile", "email"]).then((value) {
              FacebookAuth.instance.getUserData().then((userData) {
                setState(() {
                  // _isLoggedIn = true;
                  _userObj = userData;
                  print("USER DATA :: " + _userObj.toString());
                });
              });
            });
          },
          child: Image.asset(
            MyImages.ic_fb,
          ),
        ),
        SizedBox(
          width: screenSize.height * 0.02,
        ),
        GestureDetector(
          onTap: () {
            _handleSignIn();
            print("USER :: " + _currentUser!.email);
          }, // handle your image tap here
          child: Image.asset(
            MyImages.ic_gplus,
          ),
        ),
        Visibility(
          child: Row(
            children: [
              SizedBox(
                width: screenSize.height * 0.02,
              ),
              GestureDetector(
                child: Image.asset(
                  MyImages.ic_mac,
                ),
                onTap: () {},
              ),
            ],
          ),
          visible: isIOS,
        ),
      ],
    );
  }

  void emailValidCon() {
    _emailController.addListener(() {
      if (isEmail(_emailController.text)) {
        emailFormKey.currentState!.validate();
      }
    });
    _passwordController.addListener(() {
      if (validatePassword(_passwordController.text)) {
        loginFormKey.currentState!.validate();
      }
    });
  }

  void checkPlatform() {
    if (Platform.isAndroid) {
      isIOS = false;
    } else if (Platform.isIOS) {
      isIOS = true;
    }
  }

  void loginData(ModeRegister response) {
    loginAndRegistrationresponse = response;
    if (loginAndRegistrationresponse!.status) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(0)),
          ModalRoute.withName("/LoginScreen"));
    }
  }
}

bool isEmail(String em) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(em);
}
