import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';

import 'package:part_wit/ui/widgets/light_text_bold14.dart';
import 'package:part_wit/utils/utility.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SellerReviewDailog extends StatefulWidget {
  const SellerReviewDailog({Key? key}) : super(key: key);

  @override
  State<SellerReviewDailog> createState() => _SellerReviewDailogState();
}

class _SellerReviewDailogState extends State<SellerReviewDailog> {
  final double _initialRating = 1.0;
  final bool _isVertical = false;
  IconData? _selectedIcon;
    double? _rating;

  @override
  void initState() {
    super.initState();

    _rating = _initialRating;
  }

  dialogContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        ///hide keyboard function
        Utility.hideKeyboard(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyAppTheme.backgroundColor,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ),
                  LightTextBold14(
                    data: 'leaveReviewFor'.tr,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.03,
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(MyImages.logo),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.07,
                  ),
                ],
              ),
              _ratingBar(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        expands: true,
                        maxLines: null,
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
                          fillColor: MyAppTheme.buttonShadow_Color,
                          hintText: 'reviewDetails'.tr,
                          hintStyle:
                              const TextStyle(color: MyAppTheme.textPrimary),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: MyAppTheme.buttonShadow_Color),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyAppTheme.buttonShadow_Color),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width:  screenSize.width * 0.05,
                  ),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: LightTextBold14(
                    data: 'cancel'.tr,
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: LightTextBold14(
                    data: 'submit'.tr,
                  ),
                ),
                  SizedBox(
                    width:  screenSize.width * 0.05,
                  ),
              ],),
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
    return BackdropFilter(
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

  ///ratingBar
  _ratingBar() {
    return RatingBar.builder(
      initialRating: _initialRating,
      minRating: 1,
      direction: _isVertical ? Axis.vertical : Axis.horizontal,
      allowHalfRating: true,
      unratedColor:Colors.amber,
      itemCount: 5,
      itemSize: 40.0,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        _selectedIcon ?? Icons.star,
        color:MyAppTheme.pin_bg_Color ,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
          // print('?????????${_rating}');
        });
      },
      updateOnDrag: true,
    );
  }
}
