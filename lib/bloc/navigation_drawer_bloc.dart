import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/navigation_drawer_model.dart';

enum NavigationEvent { feed, joinClass, settings, info }

class NavigationBloc extends Bloc<NavigationEvent, List<NavigationItem>> {
  NavigationBloc() : super([]) {
    emit(_loadNavigationItems());
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
