import 'package:flutter/material.dart';
import 'navi_drawer_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_drawer_bloc.dart';
import 'navi_drawer_listener.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        endDrawer: NaviDrawer(),
         body: NavigationListener(
          child: Center(
            child: Text('Welcome to my home page!'),
          ),
         ),
      ),
    );
  }
}


