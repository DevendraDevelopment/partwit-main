import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utils/utility.dart';

class ItemsListedForSale extends StatefulWidget {
  const ItemsListedForSale({Key? key}) : super(key: key);

  @override
  State<ItemsListedForSale> createState() => _ItemsListedForSaleState();
}

class _ItemsListedForSaleState extends State<ItemsListedForSale> {
  int selectedIndex = -1;
  bool isVisible = true;
  bool isVisi = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double itemHeight = screenSize.height / 4.4;
    final double itemWidth = screenSize.width / 2;
    return Scaffold(
      appBar: Utility.actionBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: LightTextHead(
              data: 'itemsListed'.tr,
            ),
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Card(
                      color:
                          selectedIndex == index ? Colors.yellow : Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        width: 120,
                        height: 50,
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Center(
                            child: Text(
                          "Item Category",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: selectedIndex == index
                                  ? MyAppTheme.whiteColor
                                  : MyAppTheme.black_Color),
                        )),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                itemCount: 1,
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (isVisible) {
                          isVisible = false;
                          isVisi = true;
                        } else {
                          isVisible = true;
                          isVisi = false;
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 5, right: 5, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                  child: Image.asset(
                                MyImages.ic_img,
                                fit: BoxFit.fill,
                              )),
                              Positioned(
                                top: 1,
                                right: 0,
                                child: Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: isVisible,
                                  child: Container(
                                      margin: const EdgeInsets.all(10),
                                      width: screenSize.width * 0.15,
                                      height: screenSize.height * 0.04,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Container(
                                          color: MyAppTheme.backgroundColor,
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                MyImages.icEyes,
                                                allowDrawingOutsideViewBox:
                                                    true,
                                              ),
                                              LightTextBody(
                                                data: '15'.tr,
                                              )
                                            ],
                                          )),
                                        ),
                                      ) // This trailing comma makes auto-formatting nicer for build methods.
                                      ),
                                ),
                              ),
                              Positioned(
                                top: screenSize.height * 0.04,
                                left: screenSize.width * 0.12,
                                child: Visibility(
                                    maintainSize: true,
                                    maintainAnimation: true,
                                    maintainState: true,
                                    visible: isVisi,
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 2, sigmaY: 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            MyImages.icEditBtn,
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.01,
                                          ),
                                          SvgPicture.asset(
                                            MyImages.icDeleteBtn,
                                          ),
                                        ],
                                      ),
                                    )),
                              )
                            ],
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
          )
        ],
      ),
    );
  }
}
