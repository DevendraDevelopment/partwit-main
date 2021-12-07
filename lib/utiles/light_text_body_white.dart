// import '../styles/fonts.dart';
// import '../styles/my_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:part_wit/ui/styles/fonts.dart';

import 'my_app_theme.dart';

class LightTextBodyWhite extends StatelessWidget {
  final String data;
  const LightTextBodyWhite({required this.data}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data,
        style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: MyAppTheme.whiteColor,
            fontFamily: Fonts.biotifNormal),
      ),
    );
  }
}
