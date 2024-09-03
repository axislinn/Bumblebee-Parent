import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/navigation_drawer_model.dart';

enum NavigationEvent { feed, joinClass, settings, info }

class NavigationBloc extends Bloc<NavigationEvent, List<NavigationItem>> {
  NavigationBloc() : super([]) {
    on<NavigationEvent>((event, emit) {
      switch (event) {
        case NavigationEvent.feed:
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedPage()),
              );
          break;
        case NavigationEvent.joinClass:
          Navigator.push(
                context,  
                MaterialPageRoute(builder: (context) => JoinClassPage()),
              );
          break;
        case NavigationEvent.settings:
          // Handle navigation to Settings page
          break;
        case NavigationEvent.info:
          // Handle navigation to Info page
          break;
      }
    });
  }

  List<NavigationItem> _loadNavigationItems() {
    return [
      NavigationItem(title: 'Feed', icon: Icons.home),
      NavigationItem(title: 'Join Class', icon: Icons.group),
      NavigationItem(title: 'Settings', icon: Icons.settings),
      NavigationItem(title: 'Info', icon: Icons.info),
    ];
  }
}
