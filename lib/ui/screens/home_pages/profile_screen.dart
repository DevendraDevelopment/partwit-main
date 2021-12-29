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

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? imgUrl = "";
  String? name = "";
  String? email = "";

  void getUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = ModeRegister.fromJson(jsonDecode(pref.getString('user')!));
    setState(() {
      name = user.userInfo!.name;
      email = user.userInfo!.email!;
      imgUrl = user.userInfo!.profilePic!;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            imgUrl != null
                ? CircleAvatar(
                radius: 60.0, backgroundImage: NetworkImage(imgUrl!))
                :  const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 60,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(MyImages
                      .ic_person //Convert File type of image to asset image path),
                  ),
                )),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            LightTextHead(data: name==null?"":name!,),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            LightTextSubHead(data: email==null?"":email!,),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LightTextSubHead(
                  data: '4.5'.tr,
                ),
                SizedBox(
                  width: screenSize.width * 0.01,
                ),
                SvgPicture.asset(
                  MyImages.icStar,
                  height: 25,
                  width: 25,
                  allowDrawingOutsideViewBox: true,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                try {
                  Get.toNamed(MyRouter.saveItems);
                } on Exception catch (e) {
                  e.printError();
                }
              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      color: MyAppTheme.items_bg_Color,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LightTextSubHead(
                              data: 'Saved Items'.tr,
                            ),
                            SvgPicture.asset(
                              MyImages.icRightArrow,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) // This trailing comma makes auto-formatting nicer for build methods.
                  ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.itemsListedForSale);
              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      color: MyAppTheme.items_bg_Color,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LightTextSubHead(
                              data: 'Items Listed For Sale'.tr,
                            ),
                            SvgPicture.asset(
                              MyImages.icRightArrow,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) // This trailing comma makes auto-formatting nicer for build methods.
                  ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.editProfile);
              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      color: MyAppTheme.items_bg_Color,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LightTextSubHead(
                              data: 'Edit Profile'.tr,
                            ),
                            SvgPicture.asset(
                              MyImages.icRightArrow,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) // This trailing comma makes auto-formatting nicer for build methods.
                  ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.yourReview);
                },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      color: MyAppTheme.items_bg_Color,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LightTextSubHead(
                              data: 'See Reviews'.tr,
                            ),
                            SvgPicture.asset(
                              MyImages.icRightArrow,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) // This trailing comma makes auto-formatting nicer for build methods.
                  ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.aboutPartWit);
              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      color: MyAppTheme.items_bg_Color,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LightTextSubHead(
                              data: 'About PartWit'.tr,
                            ),
                            SvgPicture.asset(
                              MyImages.icRightArrow,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) // This trailing comma makes auto-formatting nicer for build methods.
                  ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.settings);
              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      color: MyAppTheme.items_bg_Color,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LightTextSubHead(
                              data: 'Settings'.tr,
                            ),
                            SvgPicture.asset(
                              MyImages.icRightArrow,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) // This trailing comma makes auto-formatting nicer for build methods.
                  ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: MyAppTheme.plan_bg_Color,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    color: MyAppTheme.items_bg_Color,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LightTextBody(
                                data: 'Current Plan'.tr,
                              ),
                              SizedBox(
                                height: screenSize.height * 0.01,
                              ),
                              LightTextSubHead(
                                data: 'Free'.tr,
                              ),
                            ],
                          ),
                          GestureDetector(child: Container(
                              margin: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                              width: 100,
                              height: 40,
                              child: ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  color: MyAppTheme.backgroundColor,
                                  child: Center(
                                    child: LightTextBody(
                                      data: 'Update'.tr,
                                    ),
                                  ),
                                ),
                              ) // This trailing comma makes auto-formatting nicer for build methods.
                          ), onTap: () {
                            Get.toNamed(MyRouter.planScreen);
                          },),
                        ],
                      ),
                    ),
                  ),
                ) // This trailing comma makes auto-formatting nicer for build methods.
                ),
          ],
        ),
      ),
    );
  }

}