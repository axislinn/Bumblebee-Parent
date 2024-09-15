// import 'package:bumblebee/screens/bottom_nav/bottom_nav_page/chat_page.dart';
// import 'package:bumblebee/screens/bottom_nav/bottom_nav_page/class_page.dart';
// import 'package:bumblebee/screens/bottom_nav/bottom_nav_page/notification_page.dart';
// import 'package:bumblebee/screens/home/home_screen.dart';
// import 'package:flutter/material.dart';

// class BottomNav extends StatefulWidget {
//   @override
//   _BottomNavState createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int _selectedIndex = 0;

//   // List of pages for each BottomNavigationBar item
//   final List<Widget> _pages = [
//     HomePage(), // Replace with actual page widgets
//     ChatPage(),
//     NotificationPage(),
//     ClassPage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped, // Handles tab changes
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.chat),
//           label: 'Chat',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.notifications),
//           label: 'Notification',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.class_rounded),
//           label: 'Class',
//         ),
//       ],
//       selectedItemColor: Colors.black,
//       unselectedItemColor: Colors.grey,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'bottom_nav_page/chat_page.dart';
import 'bottom_nav_page/class_page.dart';
import 'bottom_nav_page/notification_page.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => Center(child: Text('Welcome to the Home Page!')),
      ),
    ),
    Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => ChatPage(),
      ),
    ),
    Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => NotificationPage(),
      ),
    ),
    Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => ClassPage(),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
