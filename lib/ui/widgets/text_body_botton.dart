import 'package:flutter/cupertino.dart';

import '../styles/fonts.dart';
import '../styles/my_app_theme.dart';
import 'package:flutter/material.dart';

class TextBodyButton extends StatelessWidget {
  final String data;
  const TextBodyButton({required this.data}) : super();
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 17,
          color: MyAppTheme.textPrimary,
          fontFamily: Fonts.biotifNormal, fontWeight: FontWeight.bold),
    );
  }
}
