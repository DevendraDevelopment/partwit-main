import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/ui/widgets/light_text_sub_head.dart';
import 'package:part_wit/utils/utility.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Utility.actionBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(child: Image.asset(MyImages.imgPlan)),
            LightTextHead(
              data: 'upgradePlan'.tr,
            ),
            SizedBox(height: screenSize.height*0.02,),
            LightTextBody(
              data: 'makeFeature'.tr,
            ),
            SizedBox(height: screenSize.height*0.03,),
           SingleChildScrollView(
             child: Row(
               children: [
                 SizedBox(width: screenSize.width*0.02,),
                 _freePlan(screenSize),
                 SizedBox(width: screenSize.width*0.03,),
                 _premiumPlan(screenSize),
                 SizedBox(width: screenSize.width*0.03,),
                 _featuredPlan(screenSize),
                 SizedBox(width: screenSize.width*0.02,),
               ],
             ),
           ),
            SizedBox(height: screenSize.height*0.03,),
            CustomButton(
              'getPremium'.tr,
              50,
              onPressed: () {

              },
            ),
            SizedBox(height: screenSize.height*0.03,),
            LightTextSubHead(data: 'subscription'.tr),
            SizedBox(height: screenSize.height*0.01,),
            LightTextBody(data: 'subscription_disable'.tr),
            Padding(
              padding: const EdgeInsets.only(left: 5,right:5 ),
              child: LightTextBody(data: 'subscription_disable1'.tr),
            )

          ],
        ),
      ),
    );
  }

  _freePlan(Size screenSize) {
    return  Container(
        width: screenSize.width*0.30,
        height: screenSize.height*0.16 ,
      //  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
              color: MyAppTheme.box_bg_grayColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 25, 9),
                    child:   Align(
                      child: LightTextBody(
                        data: 'free'.tr,
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width*0.29,
                    height: screenSize.height*0.11 ,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      child: Container(
                        color: MyAppTheme.items_bg_Color,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LightTextSubHead(
                              data: 'free'.tr,
                            ),
                            SizedBox(height: screenSize.height*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child: LightTextBody(
                                data: 'free_plan'.tr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              )
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  _premiumPlan(Size screenSize) {
    return  Container(
        width: screenSize.width*0.30,
        height: screenSize.height*0.16 ,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
              color: MyAppTheme.backgroundColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 25, 9),
                    child:   Align(
                      child: LightTextBody(
                        data: 'premium'.tr,
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width*0.29,
                    height: screenSize.height*0.11 ,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      child: Container(
                        color: MyAppTheme.items_bg_Color,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LightTextSubHead(
                              data: 'planPrice'.tr,
                            ),
                            SizedBox(height: screenSize.height*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left:5,right: 5 ),
                              child: LightTextBody(
                                data: 'premium_plan'.tr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              )
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  _featuredPlan(Size screenSize) {
    return  Container(
        width: screenSize.width*0.30,
        height: screenSize.height*0.16 ,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
              color: MyAppTheme.box_bg_grayColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 25, 9),
                    child:   Align(
                      child: LightTextBody(
                        data: 'featured'.tr,
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width*0.29,
                    height: screenSize.height*0.11 ,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      child: Container(
                        color: MyAppTheme.items_bg_Color,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LightTextBody(
                              data: 'featuredPrice'.tr,
                            ),
                            SizedBox(height: screenSize.height*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child: LightTextBody(
                                data: 'premium_plan'.tr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              )
          ),
        )
    );
  }
}
