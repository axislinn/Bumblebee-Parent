import 'package:flutter/material.dart';

class ClassListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[300],
            child: Text('Class List'),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(title: Text('KG')),
                ListTile(title: Text('Apple 1X2C')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
