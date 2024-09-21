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
        title: Text(_titles[_selectedIndex]),
      ),
      endDrawer: NaviDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index; // Update selected tab based on page swipe
          });
        },
        children: [
          Center(child: Text('Welcome to the Home Page!')), // HomePage content
          ChatPage(),
          NotificationPage(),
          ClassPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handles tab changes
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_rounded),
            label: 'Class',
          ),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
