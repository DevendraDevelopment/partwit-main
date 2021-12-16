import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/screens/report_listing_dialog.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_body_yellow_underline.dart';
import 'package:part_wit/ui/widgets/light_text_head_green.dart';
import 'package:part_wit/ui/widgets/light_text_sub_head.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:part_wit/utils/utility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeItemsDetails extends StatefulWidget {
  const HomeItemsDetails({Key? key}) : super(key: key);

  @override
  State<HomeItemsDetails> createState() => _HomeItemsDetailsState();
}

class _HomeItemsDetailsState extends State<HomeItemsDetails> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Utility.actionBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            //viewpager
            Center(
              child: SizedBox(
                height: screenSize.height * 0.35,
                child: ContainedTabBarView(
                  tabs: [
                    ...[1, 2, 3, 4, 5]
                        .map(
                          (e) => Container(
                            width: 50,
                            height: 10,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: MyAppTheme.backgroundColor),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                  tabBarProperties: TabBarProperties(
                    width: 200,
                    height: 32,
                    margin: EdgeInsets.all(5),
                    position: TabBarPosition.bottom,
                    indicator: ContainerTabIndicator(
                      width: 30,
                      height: 10,
                      padding: EdgeInsets.all(0),
                      radius: BorderRadius.circular(5.0),
                      color: MyAppTheme.pin_bg_Color,
                    ),
                  ),
                  views: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset(
                          MyImages.ic_img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset(
                          MyImages.ic_img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset(
                          MyImages.ic_img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset(
                          MyImages.ic_img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset(
                          MyImages.ic_img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                  onChange: (index) => print(index),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LightTextSubHead(
                  data: 'itemName'.tr,
                ),
                SizedBox(
                  width: screenSize.width * 0.05,
                ),
                const LightTextHeadGreen(
                  data: '\$00',
                ),
              ],
            ),

            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            try {
                              Get.toNamed(MyRouter.sellerReviewScreen);
                            } on Exception catch (e) {
                              e.printError();
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: MyAppTheme.buttonColor,
                            radius: 30,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                MyImages.logo,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        LightTextBody(
                          data: 'sellerName'.tr,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenSize.width * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LightTextBody(
                          data: 'listedOn'.tr,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        const LightTextSubHead(
                          data: '12/01/2021',
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenSize.width * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LightTextBody(
                          data: 'expiresOn'.tr,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        const LightTextSubHead(
                          data: '12/16/2021',
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.07,
                    ),
                    const LightTextBody(
                      data: '4.5',
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    SvgPicture.asset(
                      MyImages.icStar,
                      alignment: Alignment.centerRight,
                      allowDrawingOutsideViewBox: false,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        onTap: () {
                          try {
                            Get.toNamed(MyRouter.sellerAllReviewScreen);
                          } on Exception catch (e) {
                            e.printError();
                          }
                        },
                        child: LightTextBodyYellowUnderLine(
                          data: 'seeReviewSeller'.tr,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.03,
                    ),
                    SvgPicture.asset(
                      MyImages.icShare,
                      alignment: Alignment.centerRight,
                      allowDrawingOutsideViewBox: false,
                    ),
                  ],
                ),
              ],
            ),

            const Padding(
              padding:
                  EdgeInsets.only(right: 40, left: 40, top: 20, bottom: 20),
              child: LightTextBody(
                data: Constant.LOREM,
              ),
            ),

            Container(
              height: screenSize.height * 0.05,
              width: screenSize.width * 0.40,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: MyAppTheme.textPrimary),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  try {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReportListingDialog();
                        });
                  } on Exception catch (e) {
                    e.printError();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      MyImages.icFlag,
                      alignment: Alignment.centerRight,
                      allowDrawingOutsideViewBox: false,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.02,
                    ),
                    LightTextBody(
                      data: 'reportListing'.tr,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenSize.width * 0.02,
                  ),
                  ButtonTheme(
                    minWidth: screenSize.width * 0.40,
                    height: screenSize.height * 0.07,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                            color: MyAppTheme.buttonShadow_Color)),
                    child: RaisedButton(
                      elevation: 5.0,
                      hoverColor: MyAppTheme.buttonShadow_Color,
                      color: MyAppTheme.backgroundColor,
                      child: LightTextBody(
                        data: 'messageSeller'.tr,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  ButtonTheme(
                    minWidth: screenSize.width * 0.40,
                    height: screenSize.height * 0.07,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                            color: MyAppTheme.buttonShadow_Color)),
                    child: RaisedButton(
                      elevation: 5.0,
                      hoverColor: MyAppTheme.buttonShadow_Color,
                      color: MyAppTheme.whiteColor,
                      child: LightTextBody(
                        data: 'saveItem'.tr,
                      ),
                      onPressed: () {
                        try {
                          Get.toNamed(MyRouter.saveItems);
                        } on Exception catch (e) {
                          e.printError();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
