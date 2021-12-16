import '../styles/fonts.dart';
import '../styles/my_app_theme.dart';
import 'package:flutter/material.dart';

class LightTextBold14 extends StatelessWidget {
  final String data;
  const LightTextBold14({required this.data}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data,
        style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: MyAppTheme.textPrimary,
            fontFamily: Fonts.futurBold,
          fontWeight: FontWeight.bold,),
      ),
    );
  }
}
