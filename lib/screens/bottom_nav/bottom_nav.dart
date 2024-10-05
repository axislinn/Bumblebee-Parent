import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Color.fromARGB(137, 56, 47, 47)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 4,
            blurRadius: 8,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: GNav(
          color: Colors.grey.shade400,
          backgroundColor: Colors.transparent,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade900.withOpacity(0.8),
          gap: 10,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          iconSize: 24,
          onTabChange: (index) {
            print("Tab $index selected");
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.chat,
              text: 'Chat',
            ),
            GButton(
              icon: Icons.notifications,
              text: 'Notifications',
            ),
            GButton(
              icon: Icons.class_rounded,
              text: 'Class',
            ),
          ],
        ),
      ),
    );
  }
}
