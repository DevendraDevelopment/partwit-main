import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:part_wit/repository/verify_reset_password.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/ui/widgets/light_text_title.dart';
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/utility.dart';
import 'package:get/get_core/src/get_main.dart';
class ChangePassword extends StatefulWidget {

 const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldpass_formKey = GlobalKey<FormState>();
  bool _showoldPassword = false ,_showPassword = false,_showconfirmPassword = false, _isoldPasswordFocus = false ,_isPasswordFocus = false,_isConfirmPasswordFocus = false;
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _oldController = new TextEditingController();
  TextEditingController _confrimpasswordController = new TextEditingController();
  FocusNode passWordFocus = new FocusNode();
  FocusNode oldpassWordFocus = new FocusNode();
  FocusNode confrmPassWordFocus = new FocusNode();
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
            builder: (context) => // Ensure Scaffold is in context
            // ignore: deprecated_member_use
            FlatButton(
                padding: const EdgeInsets.all(0.0),
                child: const Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
                onPressed: () => {Get.back()}),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: oldpass_formKey,
            child: Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child:  Column(
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
                  obscureText: !this._showoldPassword,
                  focusNode: oldpassWordFocus,
                  onTap: () {
                    print("EMAIN TAP");
                    //emailFocus.unfocus();
                    setState(() {
                      _isConfirmPasswordFocus = false;
                      _isPasswordFocus = false;
                      _isoldPasswordFocus = true;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter old password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIconConstraints: const BoxConstraints(
                        minHeight: 24,
                        minWidth: 24
                    ),
                    filled: true,
                    fillColor: MyAppTheme.txtShadow_Color,
                    hintText: Constant.USER_OLDPASSWORD,
                   // prefixIcon:  Image.asset(MyImages.ic_padlock),
                    // suffixIcon: Image.asset(MyImages.ic_eye_close),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: MyAppTheme.txtShadow_Color),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: MyAppTheme.txtShadow_Color),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: MyAppTheme.txtShadow_Color, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0)),
                    suffixIcon: IconButton(
                      icon: _showoldPassword
                          ? ImageIcon(AssetImage(MyImages.ic_eye_open))
                          : ImageIcon(AssetImage(MyImages.ic_eye_close)),
                      onPressed: () {
                        setState(() => _showoldPassword = !_showoldPassword);
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
                    print("EMAIN TAP");
                    //emailFocus.unfocus();
                    setState(() {
                      _isConfirmPasswordFocus = false;
                      _isPasswordFocus = true;
                      _isoldPasswordFocus = false;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIconConstraints: const BoxConstraints(
                        minHeight: 24,
                        minWidth: 24
                    ),
                    filled: true,
                    fillColor: MyAppTheme.txtShadow_Color,
                    hintText: Constant.USER_PASSWORD,
                  //  prefixIcon:  Image.asset(MyImages.ic_padlock),
                    // suffixIcon: Image.asset(MyImages.ic_eye_close),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: MyAppTheme.txtShadow_Color),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: MyAppTheme.txtShadow_Color),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: MyAppTheme.txtShadow_Color, width: 2.0),
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
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                TextFormField(
                  style: const TextStyle(
                      color: MyAppTheme.textPrimary,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                  controller: _confrimpasswordController,
                  obscureText: !this._showconfirmPassword,
                  focusNode: confrmPassWordFocus,
                  onTap: () {
                    print("EMAIN TAP");
                    //emailFocus.unfocus();
                    setState(() {
                      _isConfirmPasswordFocus = true;
                      _isPasswordFocus = false;
                      _isoldPasswordFocus = false;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter confirm password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIconConstraints: const BoxConstraints(
                        minHeight: 44,
                        minWidth: 44
                    ),
                    filled: true,
                    fillColor: MyAppTheme.txtShadow_Color,
                    hintText: Constant.CONFIRM_PSW,
                 //   prefixIcon:Image.asset(MyImages.ic_padlock),
                    //suffixIcon: Image.asset(MyImages.ic_eye_open),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: MyAppTheme.txtShadow_Color),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: MyAppTheme.txtShadow_Color),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: MyAppTheme.txtShadow_Color, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0)),
                    suffixIcon: IconButton(
                      icon: _showconfirmPassword
                          ? ImageIcon(AssetImage(MyImages.ic_eye_open))
                          : ImageIcon(AssetImage(MyImages.ic_eye_close)),
                      onPressed: () {
                        setState(() => _showconfirmPassword = !_showconfirmPassword);
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
                          if (oldpass_formKey.currentState!.validate()) {
                            _isConfirmPasswordFocus = false;
                            _isPasswordFocus = false;
                            _isoldPasswordFocus = false;
                            FocusScope.of(this.context).requestFocus(FocusNode());
                            if(_passwordController.text==_confrimpasswordController.text){
                              createOldPassword(_oldController.text,_passwordController.text,_confrimpasswordController.text,context)
                                  .then((response) {
                                setState(() {
                                  if(response.status==true){

                                  }else{
                                    Helpers.createSnackBar(context,
                                        "status false");
                                  }
                                });
                              });
                            }else{
                              Helpers.createSnackBar(context,
                                  "Your Password Don't Match");
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
            ),)
           ,
          ),
        ),
      ),
    );
  }
}
