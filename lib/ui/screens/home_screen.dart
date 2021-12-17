import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:part_wit/ui/routers/my_router.dart';
import 'package:part_wit/ui/screens/profile_screen.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/utils/utility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = -1;

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
  }

  int _currentPage = 0;
  List<Widget> navigationPage = [
    const Text('Home Page',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    const Center(
      child: Text('Search Page',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    ),
    const Center(
      child: Text('Add Page',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    ),
    const Center(
      child: Text('Chat Page',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    ),
    const UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 4.4;
    final double itemWidth = size.width / 2;
    // var width = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          Utility.hideKeyboard(context);
        },
        child: Scaffold(
            appBar: AppBar(
              // systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.orange),
              backgroundColor: MyAppTheme.backgroundColor,
              centerTitle: true,
              title: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                child: Image.asset(MyImages.ic_app_logo),
              ),
              leading: Builder(
                builder: (context) => IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: SvgPicture.asset(
                      'assets/icons/notifications.svg',
                      height: 20,
                      width: 20,
                    ),
                    onPressed: () => {Get.toNamed(MyRouter.notification)}),
              ),
              actions: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    height: 20,
                    width: 20,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            body: SafeArea(
              child: _currentPage == 0
                  ? SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Card(
                                color: selectedIndex == index
                                    ? Colors.yellow
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.white70, width: 1),
                                  borderRadius:
                                  BorderRadius.circular(50),
                                ),
                                child: Container(
                                  width: 120,
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Center(
                                      child: Text(
                                        "Item Category",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: selectedIndex == index
                                                ? MyAppTheme.whiteColor
                                                : MyAppTheme.black_Color),
                                      )),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      itemCount: 20,
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return item_home_grid();
                      },
                    ),
                  ],
                ),
              )
                  : navigationPage.elementAt(_currentPage),
            ),
            bottomNavigationBar: _createBottomNavigationBar()));
  }

  InkWell item_home_grid() {
    return InkWell(
      onTap: () {
        Get.toNamed(MyRouter.homeItemsDetails);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                MyImages.ic_img,
                height: 140,
                width: 160,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Text(
                      "Item Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: MyAppTheme.black_Color,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "12/04/2020",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  "\$00",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: MyAppTheme.black_Color,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      backgroundColor: MyAppTheme.backgroundColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedIconTheme: const IconThemeData(color: Colors.white70),
      selectedIconTheme: const IconThemeData(color: Colors.white),
      onTap: (num) {
        _currentPage = num;
        setState(() {});
      },
      showSelectedLabels: false,
      currentIndex: _currentPage,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add, size: 22), label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              size: 20,
            ),
            label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
      ],
    );
  }
}
