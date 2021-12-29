import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:part_wit/model/ModelRegister.dart';
import 'package:part_wit/repository/update_user_profile_repository.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/screens/home_screen.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/ui/widgets/light_text_sub_head.dart';
import 'package:part_wit/utils/Helpers.dart';
import 'package:part_wit/utils/utility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? imgUrl;

  void getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = ModeRegister.fromJson(jsonDecode(pref.getString('user')!));
    setState(() {
      _usernameController.text =
          user.userInfo!.name ?? "";
      _emailController.text = user.userInfo!.email! ?? "";
      imgUrl = user.userInfo!.profilePic! ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        ///hide keyboard function
        Utility.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: MyAppTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 5),
                        child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: MyAppTheme.black_Color,
                              size: 35,
                            ),
                            onPressed: () => {Get.back()}),
                      ),
                      Container(
                          child: Center(
                        child: Image.asset(
                          MyImages.ic_app_logo,
                          width: 80,
                          height: 80,
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                LightTextHead(
                  data: 'Edit Profile'.tr,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                imageProfile(context),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                LightTextBody(
                  data: 'Change Profile Photo'.tr,
                ),
                SizedBox(
                  height: screenSize.height * 0.04,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        color: MyAppTheme.buttonShadow_Color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: LightTextBody(
                                data: 'Your Name'.tr,
                              ),
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  color: MyAppTheme.textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              enabled: true,
                              obscureText: false,
                              controller: _usernameController,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Please enter name';
                                } else if (!validateName(value)) {
                                  return 'Name must be valid and doesn\'t allow any special character';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: MyAppTheme.buttonShadow_Color,
                                hintText: 'Enter Your Name'.tr,
                                errorMaxLines: 2,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: MyAppTheme.buttonShadow_Color),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyAppTheme.buttonShadow_Color),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: MyAppTheme.whiteColor,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(15.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) // This trailing comma makes auto-formatting nicer for build methods.
                    ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        color: MyAppTheme.buttonShadow_Color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: LightTextBody(
                                data: 'Email '.tr,
                              ),
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  color: MyAppTheme.textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              enabled: false,
                              obscureText: false,
                              controller: _emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: MyAppTheme.buttonShadow_Color,
                                hintText: 'Enter Your Email'.tr,
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyAppTheme.buttonShadow_Color),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) // This trailing comma makes auto-formatting nicer for build methods.
                    ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CustomButton(
                        'Save'.tr,
                        50,
                        onPressed: () {
                          try {
                            if (_formKey.currentState!.validate()) {
                              Helpers.verifyInternet().then((internet) {
                                if (internet) {
                                  if (_imageFile == null) {
                                    createUserUpdateData(File(""),
                                        _usernameController.text, context)
                                        .then((response) {
                                      setState(() {

                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomeScreen(4)),
                                            ModalRoute.withName("/HomeScreen"));
                                      });
                                    });
                                  } else {
                                    createUserUpdateData(_imageFile!,
                                        _usernameController.text.trim(), context)
                                        .then((response) {
                                      setState(() {

                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomeScreen(4)),
                                            ModalRoute.withName("/HomeScreen"));
                                        /*Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(4),
                                        ),
                                      );*/
                                      });
                                    });
                                  }
                                } else {
                                  Helpers.createSnackBar(context,
                                      "Please check your internet connection");
                                }
                              });
                            }

                          } on Exception catch (e) {
                            e.printError();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
              child: InkWell(
            onTap: () {
              openSheet();
            },
            child: _imageFile != null
                ? getImageWidget()
                : imgUrl != null
                    ?
            // FadeInImage.assetNetwork(placeholder: MyImages.loading,//MyImages.ic_person
            //     fadeOutDuration: Duration(seconds: 2),
            //     image: imgUrl!
            // )
            CircleAvatar(
                        radius: 60.0, backgroundImage: NetworkImage(imgUrl!))

                    : getImageWidget(),
          )),
          Positioned(
            bottom: 0,
            right: 5,
            child: InkWell(
              onTap: () {
                openSheet();
              },
              child: SvgPicture.asset(
                MyImages.icEdit,
                alignment: Alignment.centerRight,
                allowDrawingOutsideViewBox: false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    try {} on Exception catch (_) {
      // print('Failed to pic image $e');
    }
    final _imageFile = await _picker.pickImage(source: source);
    if (_imageFile == null) return;

    final imageTemporary = File(_imageFile.path);
    this._imageFile = imageTemporary;
    try {
      setState(() => this._imageFile = imageTemporary);

      Navigator.pop(context);
    } on Exception catch (_) {}
  }

  getImageWidget() {
    if (_imageFile != null) {
      return CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 60,
        child: CircleAvatar(
          radius: 60.0,
          backgroundImage: Image.file(_imageFile!).image,
        ),
      );
    } else {
      return const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 60,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(MyImages.ic_person //Convert File type of image to asset image path),
                ),
          ));
    }
  }

  void openSheet() {
    showModalBottomSheet(
      context: context,
      builder: ((builder) => bottomSheet(context)),
    );
  }

  bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text('Choose Profile Photo',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Opensans',
                  fontWeight: FontWeight.w400,
                  fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(
                  Icons.camera,
                  color: Colors.grey,
                ),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: const Text('Camera',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Opensans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: const Text('Gallery',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Opensans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
              )
            ],
          )
        ],
      ),
    );
  }

  /*
  bottomSheet(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      // color: MyAppTheme.backgroundColor,
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LightTextSubHead(
              data: 'chooseProfile'.tr,
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: const Icon(
                    Icons.camera,
                    // color: Colors.grey,
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: const Text('Camera',
                      style: TextStyle(
                          // color: Colors.grey,
                          fontFamily: 'Opensans',
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.image,
                    // color: Colors.grey,
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: const Text('Gallery',
                      style: TextStyle(
                          // color: Colors.grey,
                          fontFamily: 'Opensans',
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                )
              ],
            )
            *//*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: const Icon(
                    Icons.camera,
                    color: MyAppTheme.whiteColor,
                  ),
                  onPressed: () {
                    Get.back();
                    takePhoto(ImageSource.camera);
                  },
                  label: LightTextBody(
                    data: 'camera'.tr,
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.03,
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    MyImages.icEdit,
                    alignment: Alignment.centerRight,
                    allowDrawingOutsideViewBox: false,
                  ),
                  // Icon(
                  //   Icons.image,
                  //   color: MyAppTheme.whiteColor,
                  // ),
                  onTap: () {
                    Get.back();
                    takePhoto(ImageSource.gallery);
                  },
                  // label: LightTextBody(
                  //   data: 'gallery'.tr,
                  // ),
                )
              ],
            )*//*
          ],
        ),
      ),
    );
  }*/
  bool validateName(String value) {
    return RegExp(r'^(?=.*?[a-zA-Z ]).{3,80}$')
        .hasMatch(value);
  }

}
