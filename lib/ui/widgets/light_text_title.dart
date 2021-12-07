import '../styles/fonts.dart';
import '../styles/my_app_theme.dart';
import 'package:flutter/material.dart';

class LightTextTitle extends StatelessWidget {
  final String data;
  const LightTextTitle({required this.data}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25.0,right: 25.0),
      child:Center(
        child: Text(
          data,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: MyAppTheme.textPrimary,
              fontFamily: Fonts.biotifNormal),
        ),
      ) ,
    );
  }
}
