import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:part_wit/ui/screens/home_pages/home_page.dart';
import 'package:part_wit/ui/screens/home_pages/profile_screen.dart';
import 'package:part_wit/ui/styles/my_app_theme.dart';
import 'package:part_wit/ui/widgets/custom_widgets/AppBar.dart';
import 'package:part_wit/utils/utility.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen( int this.index);// : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(index);
}

class _HomeScreenState extends State<HomeScreen> {
  final int index;
  _HomeScreenState(this.index);

  @override
  void dispose() {
    super.dispose();
  }

  int _currentPage = 0;
  var isProfilePage = true;

  @override
  initState() {
    if (index == 4) {
      isProfilePage = false;
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    super.initState();
    _currentPage = index;
  }
  List<Widget> navigationPage = [
    const HomePage(),
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
    return GestureDetector(
        onTap: () {
          Utility.hideKeyboard(context);
        },
        child: Scaffold(
            appBar: buildAppBar(isProfilePage),
            body: SafeArea(
              child: navigationPage.elementAt(_currentPage),
            ),
            bottomNavigationBar: _createBottomNavigationBar()));
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      backgroundColor: MyAppTheme.backgroundColor,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: const IconThemeData(color: Colors.white70),
      selectedIconTheme: const IconThemeData(color: Colors.white),
      onTap: (int num) {
        _currentPage = num;
        setState(() {
          isProfilePage = _currentPage == 0 ? true : false;
        });
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
