import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_drawer_bloc.dart';

class NaviDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
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
            leading: Icon(Icons.home),
            title: Text('Feed'),
            onTap: () {
              Navigator.pop(context);
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvent.feed);
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Join Class'),
            onTap: () {
              Navigator.pop(context);
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvent.joinClass);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvent.settings);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Info'),
            onTap: () {
              Navigator.pop(context);
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvent.info);
            },
          ),
        ],
      ),
    );
  }
}
