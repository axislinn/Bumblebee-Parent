import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/nav_drawer/navigation_drawer_bloc.dart';

class NaviDrawer extends StatelessWidget {
  const NaviDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Feed'),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context).add(NavigateToFeed());
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Join Class'),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context).add(NavigateToJoinClass());
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context).add(NavigateToSettings());
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info'),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context).add(NavigateToInfo());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
