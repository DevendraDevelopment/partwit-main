import 'package:flutter/material.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';


class CustomCircle extends StatelessWidget{
  final String image;
  const CustomCircle(this.image,
      {required Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialButton(
     elevation: 0.0,
     onPressed: () {},
     color: MyAppTheme.circleColor,
     textColor: Colors.white,
     child: Image.asset(image),
     padding: const EdgeInsets.all(25),
     shape: const CircleBorder(),
   );
  }

}