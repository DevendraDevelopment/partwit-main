import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/utility.dart';


class PrivacyPolicy extends StatefulWidget{
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  appBar:  Utility.actionBar(),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
               child: LightTextHead(
                 data: 'policy'.tr,
               ),
             ),
             LightTextBody(data: Constant.LOREM,)
           ],
         ),
       ),
     ),
   );
  }
}