import 'package:bumblebee/screens/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import '../navi_drawer/navi_drawer_screen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey,
          title: Text('Home'),
        ),
        endDrawer: const NaviDrawer(),
        body: Center(
          child: Text('Welcome to the Home Page!'),
        ),
        bottomNavigationBar: BottomNav());
  }
}
