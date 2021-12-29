import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utils/Helpers.dart';
import 'package:part_wit/utils/constant.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as loc;
class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {


  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyAppTheme.backgroundColor),
    );
    _checkGps();
  }

   Location location = Location();//explicit reference to the Location class

   Future _checkGps() async {
    // loc.Location locationR = loc.Location();
    /* if (!await locationR.serviceEnabled()) {
       locationR.requestService();
     }*/
     if (!await location.serviceEnabled()) {
       location.requestService();
     }
   }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.10,
            ),
            Center(
              child: Image.asset(MyImages.ic_app_logo),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Center(
              child: Image.asset(MyImages.ic_location),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            const LightTextHead(
              data: Constant.LOCATION_TEXT,
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            const LightTextBody(
              data: Constant.ALLOW_TEXT1,
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            const LightTextBody(
              data: Constant.ALLOW_TEXT2,
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  CustomButton(
                    Constant.ALWAYS,
                    54,
                    onPressed: () {
                      try {
                        checkPermission();
                        // Get.toNamed(MyRouter.loginScreen);

                      } on Exception catch (e) {
                        e.printError();
                      }
                    },
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  CustomButton(
                    Constant.WHILE_USING_APP,
                    54,
                    onPressed: () {
                      checkPermission();
                    },
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  CustomButton(
                    Constant.NEVER,
                    54,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MyRouter.loginScreen);
                      // checkDeniedPermission();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkPermission() async {
    await _handleLocationPermission(Permission.location);
  }

  Future<void> _handleLocationPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      Navigator.pushReplacementNamed(context, MyRouter.loginScreen);
    } else if (status.isDenied) {
      Helpers.createSnackBar(context, "Permission Denied");
    }
  }

  void checkDeniedPermission() async {
    await _handleDeniedPermission(Permission.location);
  }

  Future<void> _handleDeniedPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isDenied) {
      Helpers.createSnackBar(context, "Permission Denied");
    }
  }
}
