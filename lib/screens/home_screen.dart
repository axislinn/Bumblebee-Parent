import 'package:bumblebee/screens/bottom_nav.dart/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Home'),
        ),
        endDrawer: Drawer(),
        body: Center(
          child: Text('Welcome to the Home Page!'),
        ),
        bottomNavigationBar: BottomNav());
  }
}
