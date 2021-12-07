import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:part_wit/ui/screens/profile_screen.dart';
import 'package:part_wit/ui/screens/verification_screen.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/styles/my_images.dart';
import 'package:part_wit/ui/widgets/light_text_head.dart';
import 'package:part_wit/utiles/utility.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectindex = -1;

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
  List<Widget> navigavtionPage = [
    Text('Home Page',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    Center(
      child: Text('Search Page',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    ),
    Center(
      child: Text('Add Page',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    ),
    Center(
      child: Text('Chat Page',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    ),

    UserProfile()
    //Center(child: Text('Profile Page', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),)  ,
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 4.4;
    final double itemWidth = size.width / 2;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        ///hide keyboard function
        Utility.hideKeyboard(context);
      },
      child: Scaffold(

          //backgroundColor: MyAppTheme.backgroundColor,
          appBar: AppBar(
            backgroundColor: MyAppTheme.backgroundColor,
            brightness: Brightness.dark,
            centerTitle: true,
            title: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Image.asset(MyImages.ic_app_logo),
            ),
            leading: Builder(
              builder: (context) => // Ensure Scaffold is in context
                  // ignore: deprecated_member_use
                  FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: SvgPicture.asset(
                        'assets/icons/notifications.svg',
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () => {}),
            ),
            actions: [
              IconButton(
                icon: new SvgPicture.asset(
                  'assets/icons/menu.svg',
                  height: 20,
                  width: 20,
                ),
                onPressed: () {
                  /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                );*/
                },
              )
            ],
          ),
          body: SafeArea(
            child: _currentPage == 0
                ? Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectindex = index;
                                  });
                                },
                                child: Card(
                                  color: selectindex == index
                                      ? Colors.yellow
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.white70, width: 1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Container(
                                    width: 120,
                                    height: 50,
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Center(
                                        child: Text(
                                      "Item Category",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: selectindex == index
                                              ? MyAppTheme.whiteColor
                                              : MyAppTheme.black_Color),
                                    )),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: GridView.builder(
                            itemCount: 20,
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: (itemWidth / itemHeight),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 5, right: 5, top: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        MyImages.ic_img,
                                        height: 140,
                                        width: 160,
                                        fit: BoxFit.fill,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Item Name",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color:
                                                        MyAppTheme.black_Color,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "12/04/2020",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
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
                            },
                          ),
                        ),
                      )
                    ],
                  )
                : navigavtionPage.elementAt(_currentPage),
          ),
          bottomNavigationBar: _createBottomNavigationBar()),
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
      currentIndex: _currentPage,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add, size: 22), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.chat, size: 20,), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
      ],
    );
  }
}
