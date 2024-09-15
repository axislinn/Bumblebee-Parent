import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class"),
      ),
      body: Center(
        child: Text('This Page is Class Page.'),
      ),
    );
  }
}
