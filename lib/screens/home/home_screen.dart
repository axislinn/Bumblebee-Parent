import 'package:bumblebee/screens/bottom_nav/bottom_nav.dart';
import 'package:bumblebee/screens/bottom_nav/bottom_nav_page/chat_page.dart';
import 'package:bumblebee/screens/bottom_nav/bottom_nav_page/class_page.dart';
import 'package:bumblebee/screens/bottom_nav/bottom_nav_page/notification_page.dart';
import 'package:flutter/material.dart';
import '../navi_drawer/navi_drawer_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // List of titles for each page
  final List<String> _titles = ['Home', 'Chat', 'Notification', 'Class'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController
          .jumpToPage(index); // Update PageView based on selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(_titles[_selectedIndex]), // Dynamic title
      ),
      endDrawer: const NaviDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index; // Update selected tab based on page swipe
          });
        },
        children: const [
          Center(child: Text('Welcome to the Home Page!')), // HomePage content
          ChatPage(),
          NotificationPage(),
          ClassPage(),
        ],
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex, // Pass selectedIndex
        onItemTapped: _onItemTapped, // Pass the tap handler
      ),
    );
  }
}
