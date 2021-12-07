import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:part_wit/controller/binding_controller.dart';

import 'ui/routers/my_router.dart';
import 'ui/styles/locale_string.dart';

void main() {
  BindingController().dependencies();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    services.SystemChrome.setPreferredOrientations([
      services.DeviceOrientation.portraitUp,
      services.DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      //locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'PartWit',
      getPages: MyRouter.route,
    );
  }
}
