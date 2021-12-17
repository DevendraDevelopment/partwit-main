import 'package:part_wit/ui/styles/fonts.dart';
//
// import '../styles/my_app_theme.dart';
// import '../styles/fonts.dart';
import 'package:flutter/material.dart';

import 'my_app_theme.dart';

class LightTextBodyBold extends StatelessWidget {
  final String data;

  const LightTextBodyBold({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        color: MyAppTheme.black_Color,
        fontFamily: Fonts.biotifNormal,
      ),
    );
  }
}
