import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_widgets/common_widget.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:get/get_core/src/get_main.dart';

class AboutPartWit extends StatelessWidget {
  const AboutPartWit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            addHeight(screenSize.height * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                    onPressed: () => {Get.back()}),
              ],
            ),
            Center(
              child: Image.asset(MyImages.ic_app_logo),
            ),
            addHeight(
              screenSize.height * 0.03,
            ),
            LightTextHead(
              data: 'aboutPartWit'.tr,
            ),
            addHeight(
              screenSize.height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: LightTextBody(
                data: Constant.LOREM,
              ),
            ),
            addHeight(
              screenSize.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

}
