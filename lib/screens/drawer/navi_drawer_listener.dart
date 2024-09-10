import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/nav_drawer/navigation_drawer_bloc.dart';
import '../home/home_screen.dart';
import '../home/feed_screen.dart';
import '../home/info_screen.dart';

class NavigationListener extends StatelessWidget {
  final Widget child;

  NavigationListener({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is FeedPageState) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
        } else if (state is JoinClassPageState) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const FeedPage()));
        } else if (state is SettingsPageState) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const InfoPage())); 
        } else if (state is InfoPageState) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const InfoPage()));
        }
      },
      child: child,
    );
  }
}
