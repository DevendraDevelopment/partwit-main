import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/utility.dart';
class ChangePassword extends StatefulWidget{
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _showPassword = false,
      _showconfirmPassword = false,
      _isPasswordFocus = false,
      _isNewPasswordFocus = false,
      _isConfirmPasswordFocus = false;


  FocusNode passWordFocus =   FocusNode();
  FocusNode newPassWordFocus =   FocusNode();
  FocusNode confirmNewPswFocus =   FocusNode();

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
   return GestureDetector(
     onTap: () {
       ///hide keyboard function
       Utility.hideKeyboard(context);
     },
     child: Scaffold(
       appBar: Utility.actionBar(),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
             child: LightTextHead(
               data: 'changePsw'.tr,
             ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
             child: TextFormField(
               style: const TextStyle(
                   color: MyAppTheme.textPrimary,
                   fontWeight: FontWeight.normal,
                   fontSize: 14),
               obscureText: !this._showconfirmPassword,
               focusNode: newPassWordFocus,
               onTap: () {
                 //emailFocus.unfocus();
                 setState(() {
                   _isConfirmPasswordFocus = true;
                   _isPasswordFocus = false;
                   _isNewPasswordFocus = false;
                 });
               },
               validator: (value) {
                 if (value!.isEmpty) {
                   return 'Please enter password';
                 } else if (value.length < 5) {
                   return 'Password must be greater then 5';
                 }
                 return null;
               },
               decoration: InputDecoration(
                 suffixIconConstraints:
                 const BoxConstraints(minHeight: 44, minWidth: 44),
                 filled: true,
                 fillColor: MyAppTheme.textfield_bg_grayColor,
                 hintText: 'oldPassword'.tr,
                 prefixIcon: Image.asset(MyImages.ic_padlock),
                 focusedBorder: OutlineInputBorder(
                   borderSide: const BorderSide(
                       color: MyAppTheme.textfield_bg_grayColor),
                   borderRadius: BorderRadius.circular(15.0),
                 ),
                 enabledBorder: const OutlineInputBorder(
                     borderSide:
                     BorderSide(color: MyAppTheme.textfield_bg_grayColor),
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
           Padding(
             padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
             child: TextFormField(
               style: const TextStyle(
                   color: MyAppTheme.textPrimary,
                   fontWeight: FontWeight.normal,
                   fontSize: 14),
               obscureText: !this._showconfirmPassword,
               focusNode: newPassWordFocus,
               onTap: () {
                 //emailFocus.unfocus();
                 setState(() {
                   _isConfirmPasswordFocus = true;
                   _isPasswordFocus = false;
                   _isNewPasswordFocus = false;
                 });
               },
               validator: (value) {
                 if (value!.isEmpty) {
                   return 'Please enter password';
                 } else if (value.length < 5) {
                   return 'Password must be greater then 5';
                 }
                 return null;
               },
               decoration: InputDecoration(
                 suffixIconConstraints:
                 const BoxConstraints(minHeight: 44, minWidth: 44),
                 filled: true,
                 fillColor: MyAppTheme.textfield_bg_grayColor,
                 hintText: 'newPassword'.tr,
                 prefixIcon: Image.asset(MyImages.ic_padlock),
                 focusedBorder: OutlineInputBorder(
                   borderSide: const BorderSide(
                       color: MyAppTheme.textfield_bg_grayColor),
                   borderRadius: BorderRadius.circular(15.0),
                 ),
                 enabledBorder: const OutlineInputBorder(
                     borderSide:
                     BorderSide(color: MyAppTheme.textfield_bg_grayColor),
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
           Padding(
             padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
             child: TextFormField(
               style: const TextStyle(
                   color: MyAppTheme.textPrimary,
                   fontWeight: FontWeight.normal,
                   fontSize: 14),
               obscureText: !this._showconfirmPassword,
               focusNode: newPassWordFocus,
               onTap: () {
                 //emailFocus.unfocus();
                 setState(() {
                   _isConfirmPasswordFocus = true;
                   _isPasswordFocus = false;
                   _isNewPasswordFocus = false;
                 });
               },
               validator: (value) {
                 if (value!.isEmpty) {
                   return 'Please enter password';
                 } else if (value.length < 5) {
                   return 'Password must be greater then 5';
                 }
                 return null;
               },
               decoration: InputDecoration(
                 suffixIconConstraints:
                 const BoxConstraints(minHeight: 44, minWidth: 44),
                 filled: true,
                 fillColor: MyAppTheme.textfield_bg_grayColor,
                 hintText: 'confirmNewPassword'.tr,
                 prefixIcon: Image.asset(MyImages.ic_padlock),
                 focusedBorder: OutlineInputBorder(
                   borderSide: const BorderSide(
                       color: MyAppTheme.textfield_bg_grayColor),
                   borderRadius: BorderRadius.circular(15.0),
                 ),
                 enabledBorder: const OutlineInputBorder(
                     borderSide:
                     BorderSide(color: MyAppTheme.textfield_bg_grayColor),
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
           SizedBox(height: screenSize.height*0.05,),
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
             child: Column(
               children: [
                 CustomButton(
                   'update'.tr,
                   50,
                   onPressed: () {
                     Get.back();
                   },
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
   );
  }
}