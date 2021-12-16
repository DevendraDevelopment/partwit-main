import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/ui/widgets/light_text_sub_head.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_svg/svg.dart';
import 'package:part_wit/utils/light_text_body_bold.dart';

class YourReview extends StatefulWidget {
  const YourReview({Key? key}) : super(key: key);

  @override
  State<YourReview> createState() => _YourReviewState();
}

class _YourReviewState extends State<YourReview> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
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
          builder: (context) =>
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
              data: 'yourReview'.tr,
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) =>
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                      color: MyAppTheme.items_bg_Color,
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5),
                                                child: CircleAvatar(
                                                    backgroundColor: Colors
                                                        .grey,
                                                    radius: 40,
                                                    child: CircleAvatar(
                                                      radius: 40,
                                                      backgroundImage: AssetImage(
                                                          MyImages
                                                              .logo //Convert File type of image to asset image path),
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: screenSize.height *
                                                    0.01,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    LightTextSubHead(
                                                      data: '4.5'.tr,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                      screenSize.width * 0.01,
                                                    ),
                                                    SvgPicture.asset(
                                                      MyImages.icStar,
                                                      height: 25,
                                                      width: 25,
                                                      allowDrawingOutsideViewBox:
                                                      true,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.02,
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  LightTextBodyBold(
                                                    data: 'personName'.tr,
                                                  ),
                                                  SizedBox(
                                                    width: screenSize.width *
                                                        0.20,
                                                  ),
                                                  LightTextBody(
                                                    data: 'agoTime'.tr,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: screenSize.height *
                                                    0.01,
                                              ),
                                              SizedBox(
                                                height: screenSize.height *
                                                    0.10,
                                                width: screenSize.width * 0.60,
                                                child: const LightTextBody(
                                                  data: "Test", //Constant.LOREM1,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          )
                      )))
        ],
      ),
    );
  }
}
