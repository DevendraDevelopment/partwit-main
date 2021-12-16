import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_bold14.dart';
import 'package:part_wit/utils/utility.dart';
import 'package:get/get_core/src/get_main.dart';

class ReportListingDialog extends StatefulWidget {
  const ReportListingDialog({Key? key}) : super(key: key);

  @override
  State<ReportListingDialog> createState() => _ReportListingDialogState();
}

class _ReportListingDialogState extends State<ReportListingDialog> {

  dialogContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Utility.hideKeyboard(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyAppTheme.whiteColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: [
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: LightTextBold14(
                      data: 'reportListing'.tr,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        MyImages.icClose,
                        alignment: Alignment.centerRight,
                        allowDrawingOutsideViewBox: false,
                      ),
                    ),
                  ),

                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        TextFormField(
                          style: const TextStyle(
                              color: MyAppTheme.textPrimary,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                          obscureText: false,

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyAppTheme.textfield_bg_grayColor,
                            hintText: 'selectReason'.tr,
                            suffixIcon: Image.asset(MyImages.icDropDown),
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: MyAppTheme.whiteColor),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: MyAppTheme.whiteColor),
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: MyAppTheme.whiteColor, width: 2.0),
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        SizedBox(
                          height: 150,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textAlignVertical: TextAlignVertical.top,
                            expands: true,
                            minLines: null,
                            style: const TextStyle(
                                color: MyAppTheme.textPrimary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                            obscureText: false,
                            maxLength: 150,
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: MyAppTheme.textfield_bg_grayColor,
                              hintText: 'provideMoreDetail'.tr,
                              hintStyle:
                              const TextStyle(color: MyAppTheme.textPrimary),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: MyAppTheme.textfield_bg_grayColor),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: MyAppTheme.textfield_bg_grayColor),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: MyAppTheme.buttonShadow_Color,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30,left: 30,top: 20),
                child: CustomButton(
                  'submit'.tr,
                  50,
                  onPressed: () {
                    try {
                      Get.back();
                    } on Exception catch (e) {
                      e.printError();
                    }
                  },
                ),
              ),

              SizedBox(
                height: screenSize.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  BackdropFilter(
      ///filter for blur background
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(
          context,
        ),
      ),
    );
  }
}
