import 'package:bumblebee/screens/splashscreen.dart';
import 'package:flutter/material.dart';
 // Adjust the import path if needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: 'BLoC Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Make sure this screen exists and is correctly implemented
    );
  }
}
