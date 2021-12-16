import '../styles/fonts.dart';
import '../styles/my_app_theme.dart';
import 'package:flutter/material.dart';

class LightTextBodyYellowUnderLine extends StatelessWidget {
  final String data;
  const LightTextBodyYellowUnderLine({required this.data}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data,
        style: const TextStyle(
            decoration: TextDecoration.underline,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: MyAppTheme.backgroundColor,
            fontFamily: Fonts.biotifNormal),
      ),
    );
  }
}