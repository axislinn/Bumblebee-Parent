import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/navigation_drawer_model.dart';
import '../bloc/navigation_drawer_bloc.dart';

class NaviDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<NavigationBloc, List<NavigationItem>>(
        builder: (context, navigationItems) {
          return ListView(
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
              ...navigationItems.map((item) => ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )),
            ],
          );
        },
      ),
    );
  }
}
