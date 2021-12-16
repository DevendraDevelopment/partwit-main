import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_sub_head.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
          builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => {Get.back()}),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
              child: LightTextSubHead(
                data: 'Settings'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LightTextBody(
                            data: 'Notifications'.tr,
                          ),
                          CupertinoSwitch(
                            activeColor: MyAppTheme.buttonColor,
                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: Divider(color: MyAppTheme.border_Color),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(MyRouter.changePassword);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: LightTextBody(
                          data: 'Change Password'.tr,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: Divider(color: MyAppTheme.border_Color),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LightTextBody(
                            data: 'Language'.tr,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              LightTextBody(
                                data: 'English'.tr,
                              ),
                              const Icon(Icons.arrow_drop_down_outlined)
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: Divider(color: MyAppTheme.border_Color),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(MyRouter.privacypolicy);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: LightTextBody(
                          data: 'Privacy Policy'.tr,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: Divider(color: MyAppTheme.border_Color),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(MyRouter.termscondition);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 30),
                        child: LightTextBody(
                          data: 'Terms & Condition'.tr,
                        ),
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 7,
                margin: const EdgeInsets.all(10),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.10,
            ),
            CustomButton(
              'logout'.tr,
              50,
              onPressed: () async {
                try {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.pushReplacementNamed(context, MyRouter.loginScreen);
                } on Exception catch (e) {
                  e.printError();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
