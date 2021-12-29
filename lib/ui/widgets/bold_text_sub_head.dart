import '../styles/my_app_theme.dart';
import '../styles/fonts.dart';
import 'package:flutter/material.dart';

class BoldTextSubHead extends StatelessWidget {
  final String data;
  const BoldTextSubHead({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data,
        style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: MyAppTheme.textPrimary,
            fontFamily: Fonts.biotifSemiBold,
        fontWeight: FontWeight.bold),
      ),
    );
  }
}
