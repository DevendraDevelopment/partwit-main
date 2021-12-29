import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/model/ModelRegister.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/ui/widgets/light_text_sub_head.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 4.4;
    final double itemWidth = size.width / 2;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
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
                      color: selectedIndex == index
                          ? Colors.yellow
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        width: 120,
                        height: 50,
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0),
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
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            itemCount: 20,
            shrinkWrap: true,
            primary: false,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
            ),
            itemBuilder: (BuildContext context, int index) {
              return item_home_grid();
            },
          ),
        ],
      ),
    );
  }

  InkWell item_home_grid() {
    return InkWell(
      onTap: () {
        Get.toNamed(MyRouter.homeItemsDetails);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                MyImages.ic_img,
                height: 140,
                width: 160,
                fit: BoxFit.fill,
              ),
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
  }

}
