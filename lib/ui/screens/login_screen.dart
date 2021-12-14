import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:part_wit/model/LoginModel.dart';
import 'package:part_wit/model/ModelRegister.dart';
import 'package:part_wit/repository/user_repository.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/ui/widgets/light_text_sub_head.dart';
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constaint.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/utility.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import "package:http/http.dart" as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final login_formKey = GlobalKey<FormState>();
  bool _showPassword = false, _isEmailFocus = false, _isPasswordFocus = false;

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  FocusNode emailFocus = new FocusNode();
  FocusNode passWordFocus = new FocusNode();

  bool isLoggedIn = false;

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
    if (kIsWeb) {
      // initialiaze the facebook javascript SDK
      FacebookAuth.instance.webInitialize(
        appId: "3149092691975649",
        cookie: true,
        xfbml: true,
        version: "v11.0",
      );
    }
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        print("GOOGLE1" + _currentUser!.email.toString());
      });
    });
    // _googleSignIn.signInSilently();
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
            key: login_formKey,
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
                Padding(
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
                      }
                      /* else if (!isEmail(_emailController.text)) {
                        return 'Please enter valid email address';
                      }*/
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
                      //emailFocus.unfocus();
                      setState(() {
                        _isEmailFocus = false;
                        _isPasswordFocus = true;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }else if (value.length < 8) {
                        return 'Password must be greater then 8';
                      } else if (value.length > 20){
                        return 'Password must be less then 20';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: Constant.USER_PASSWORD,
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
                            ? ImageIcon(AssetImage(MyImages.ic_eye_open))
                            : ImageIcon(AssetImage(MyImages.ic_eye_close)),
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
                          Get.toNamed(MyRouter.createProfile);
                          /*if (login_formKey.currentState!.validate()) {
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
                          }*/
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (kIsWeb) {
                          // initialiaze the facebook javascript SDK
                          FacebookAuth.instance.webInitialize(
                            appId: "3149092691975649",
                            cookie: true,
                            xfbml: true,
                            version: "v11.0",
                          );
                        }

                        FacebookAuth.instance.login(
                            permissions: ["public_profile", "email"]).then((value) {
                          print("FB DATA :: "+value.toString()+"\n"+value.status.toString());
                          print("FB DATA 1 :: "+value.accessToken.toString());
                          FacebookAuth.instance.getUserData().then((userData) {
                            setState(() {
                              // _isLoggedIn = true;
                              _userObj = userData;
                              print("USER DATA :: "+_userObj.toString());
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
                        print("EMAIL :: " + _currentUser!.email);
                        Helpers.createSnackBar(context, "EMAIL :: " + _currentUser!.email);
                      }, // handle your image tap here
                      child: Image.asset(
                        MyImages.ic_gplus,
                      ),
                    ),
                    SizedBox(
                      width: screenSize.height * 0.02,
                    ),
                    Image.asset(
                      MyImages.ic_mac,
                    ),
                  ],
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
                    InkWell(
                        onTap: () {
                          try {
                            Get.toNamed(MyRouter.signupScreen);
                          } on Exception catch (e) {
                            e.printError();
                          }
                        },
                        child: const LightTextSubHead(
                          data: Constant.SIGNUP_HERE,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginData(ModeRegister response) {
    loginAndRegistrationresponse = response;
    if (loginAndRegistrationresponse!.status) {
      Get.toNamed(MyRouter.homeScreen);
    }
  }
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}
