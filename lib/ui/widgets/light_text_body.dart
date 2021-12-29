import '../styles/fonts.dart';
import '../styles/my_app_theme.dart';
import 'package:flutter/material.dart';

class LightTextBody extends StatelessWidget {
  final String data;
  const LightTextBody({required this.data}) : super();
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: MyAppTheme.textPrimary,
          fontFamily: Fonts.biotifNormal),
    );
  }
}
