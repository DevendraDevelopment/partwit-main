import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/screens/seller_review_dialog.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:flutter_svg/svg.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';

class SellerReviewScreen extends StatefulWidget {
  const SellerReviewScreen({Key? key}) : super(key: key);

  @override
  State<SellerReviewScreen> createState() => _SellerReviewScreenState();
}

class _SellerReviewScreenState extends State<SellerReviewScreen> {
  final double circleRadius = 120.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double itemHeight = screenSize.height / 4.4;
    final double itemWidth = screenSize.width / 2;
    return Scaffold(
        body: Column(
      children: [
        _ImageWithBar(screenSize),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        LightTextBody(
          data: 'sellerName'.tr,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
            child: LightTextHead(
              data: 'recentlyListedItems'.tr,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: GridView.builder(
              itemCount: 20,
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 5, right: 5, top: 10, bottom: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          MyImages.ic_img,
                          height: 130,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "Item Name",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: MyAppTheme.black_Color,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "12/04/2020",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Text(
                              "\$00",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: MyAppTheme.black_Color,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        CustomButton(
          'reviewSeller'.tr,
          50,
          onPressed: () {
            try {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const SellerReviewDailog();
                  });
            } on Exception catch (e) {
              e.printError();
            }
          },
        ),
      ],
    ));
  }

  _ImageWithBar(Size screenSize) {
    return SizedBox(
      height: screenSize.height * 0.20,
      child: Expanded(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    bottom: circleRadius / 2.0,
                  ),
                  child: Container(
                    height: screenSize.height * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      color: MyAppTheme.backgroundColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 2.0),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.arrow_back,
                                        size: 30,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        )),
                  ),
                ),

                ///Image Avatar
                const Card(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 55,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(MyImages
                                .logo //Convert File type of image to asset image path),
                            ),
                      )),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
