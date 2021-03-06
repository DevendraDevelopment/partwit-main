import 'package:flutter/material.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:part_wit/utiles/light_text_body_bold.dart';
class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  _TermsConditionState createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 15.0,right: 15.0,left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    const LightTextBodyBold(data: Constant.TERMS),
                    SizedBox(height: 10,),
                    const LightTextBody(data: Constant.PRIVACYPOLICY),
                    SizedBox(height: 20,),
                    const LightTextBody(data: Constant.PRIVACYPOLICY),
                  ],
                ),
              )
              ,
        ),
      ),
    );
  }
}
