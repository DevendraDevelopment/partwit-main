
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:part_wit/repository/update_user_profile_repository.dart';
import 'package:part_wit/ui/widgets/custom_button.dart';
import 'package:part_wit/ui/widgets/light_text_body.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/Helpers.dart';
import 'package:part_wit/utiles/constant.dart';
import 'package:part_wit/utiles/my_app_theme.dart';
import 'package:part_wit/utiles/my_images.dart';
import 'package:part_wit/utiles/utility.dart';


class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final profile_formKey = GlobalKey<FormState>();
  bool _isNameFocus = false;
  TextEditingController _nameController = new TextEditingController();
  FocusNode nameFocus = new FocusNode();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

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
            key: profile_formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.10,
                ),
                Center(
                  child: Image.asset(MyImages.ic_app_logo),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                const LightTextHead(
                  data: Constant.CREATE_PROFILE,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                imageProfile(context),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                const LightTextBody(
                  data: Constant.UPLOAD_PROFILE,
                ),
                SizedBox(
                  height: screenSize.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: TextFormField(
                    style: const TextStyle(
                        color: MyAppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),

                    obscureText: false,
                    focusNode: nameFocus,
                    controller: _nameController,
                    onTap: () {
                      setState(() {
                        _isNameFocus = true;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter name';
                      }
                      /* else if (!isEmail(_emailController.text)) {
                        return 'Please enter valid email address';
                      }*/
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyAppTheme.buttonShadow_Color,
                      hintText: Constant.YOUR_NAME,
                      prefixIcon: Image.asset(MyImages.ic_feather_user),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: MyAppTheme.buttonShadow_Color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyAppTheme.buttonShadow_Color),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyAppTheme.whiteColor, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CustomButton(
                        Constant.CONTINUE,
                        54,
                        onPressed: () {
                          if (profile_formKey.currentState!.validate()) {
                            _isNameFocus = false;
                            FocusScope.of(this.context).requestFocus(FocusNode());
                            Helpers.verifyInternet().then((intenet) {
                              if (intenet != null && intenet) {
                                createUserUpdateData(_imageFile!,
                                        _nameController.text, context)
                                    .then((response) {
                                  setState(() {

                                  });
                                });
                              } else {
                                Helpers.createSnackBar(context,
                                    "Please check your internet connection");
                              }
                            });
                          }

                          /* try {
                            Get.toNamed(MyRouter.welcomeScreen);
                          } on Exception catch (e) {
                            e.printError();
                          }*/
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
              OpenSheet();
            },
            child: getImageWidget(),
          )),
          Positioned(
            bottom: 8,
            right: 5,
            child: InkWell(
              onTap: () {
                OpenSheet();
              },
              child: const Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    try {} on Exception catch (_, e) {
      print('Failed to pic image $e');
    }
    final _imageFile = await _picker.pickImage(source: source);
    if (_imageFile == null) return;

    final imageTemporary = File(_imageFile.path);
    this._imageFile = imageTemporary;

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      this._imageFile = imageTemporary;

      // Your Code
    });
    // setState(() => this._imageFile = imageTemporary);
  }

  getImageWidget() {
    if (_imageFile != null) {
      Navigator.pop(context);
      return CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 60,
        child: CircleAvatar(
          radius: 58.0,
          backgroundImage: Image.file(_imageFile!).image,
        ),
      );
    } else {
      return const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 60,
          child: CircleAvatar(
            radius: 58,
            backgroundImage: AssetImage(MyImages
                    .ic_person //Convert File type of image to asset image path),
                ),
          ));
    }
  }

  void OpenSheet() {
    showModalBottomSheet(
      context: context,
      builder: ((builder) => bottomSheet(context)),
    );
  }

  bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
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
}
