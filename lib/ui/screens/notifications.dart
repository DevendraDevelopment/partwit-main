import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:part_wit/utils/utility.dart';

class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Utility.actionBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: LightTextHead(
              data: 'notifications'.tr,
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10,  0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: CircleAvatar(
                                      backgroundColor:
                                          MyAppTheme.backgroundColor,
                                      radius: 40,
                                      child: Image.asset(
                                        MyImages.ic_app_logo,
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.02,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: screenSize.height * 0.01,
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.10,
                                        width: screenSize.width * 0.45,
                                        child: const LightTextBody(
                                          data: Constant
                                              .TEXT_DEMO, //Constant.LOREM1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: LightTextBody(
                                      data: 'agoTime'.tr, //Constant.LOREM1,
                                    ),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 2,
                              margin: const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ) // This trailing comma makes auto-formatting nicer for build methods.
                      ))),
        ],
      ),
    );
  }
}
