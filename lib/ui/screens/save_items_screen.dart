import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/light_text_body_bold.dart';
import 'package:part_wit/utiles/light_text_body_white.dart';

class SaveItems extends StatelessWidget {
  const SaveItems({Key? key}) : super(key: key);

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
          builder: (context) => // Ensure Scaffold is in context
              // ignore: deprecated_member_use
              FlatButton(
                  padding: const EdgeInsets.all(0.0),
                  child: const Icon(Icons.arrow_back),
                  onPressed: () => {Get.back()}),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: LightTextHead(
              data: 'saveItems'.tr,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) => Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 1),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                      elevation: 0.0,
                      child: Row(
                        children: [
                          Material(
                            elevation: 1.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                MyImages.logo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        LightTextBodyBold(
                                          data: 'itemName'.tr,
                                        ),
                                        const LightTextBody(
                                          data: "Test",//Constant.DATE,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.33,
                                    ),
                                    const LightTextBodyBold(
                                      data: "Test",//Constant.DOLLAR,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.all(0),
                                        width: screenSize.width * 0.35,
                                        height: screenSize.height * 0.05,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          child: Container(
                                            color: MyAppTheme.buttonColor,
                                            child: Center(
                                              child: LightTextBodyWhite(
                                                data: 'reviewSeller'.tr,
                                              ),
                                            ),
                                          ),
                                        ) // This trailing comma makes auto-formatting nicer for build methods.
                                        ),
                                    SizedBox(
                                      width: screenSize.width * 0.20,
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(MyImages.icDelete)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
