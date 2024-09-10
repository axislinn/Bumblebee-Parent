//import 'package:bumblebee/screens/bottom_nav.dart/bottom_nav.dart';
import 'package:bumblebee/screens/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import '../drawer/navi_drawer_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/nav_drawer/navigation_drawer_bloc.dart';
import '../drawer/navi_drawer_listener.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Home'),
        ),
        endDrawer: NaviDrawer(),
        body: Center(
          child: Text('Welcome to the Home Page!'),
        ),
        bottomNavigationBar: BottomNav());
  }
}
