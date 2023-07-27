import 'package:carib/Screens/BottomBar/cart.dart';
import 'package:carib/Screens/BottomBar/notification.dart';
import 'package:carib/Screens/BottomBar/dashboard.dart';
import 'package:carib/Screens/BottomBar/profile.dart';
import 'package:carib/Screens/BottomBar/setting.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> currentPage = [
    const Dashboard(),
    const CartPage(),
    const NotificationPage(),
    const Settings(),
    const ProfilePage(),
  ];
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_bag, size: 30),
          Icon(Icons.notifications, size: 30),
          Icon(Icons.settings, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white70,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Colors.white70,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: currentPage[_page],
    );
  }
}
