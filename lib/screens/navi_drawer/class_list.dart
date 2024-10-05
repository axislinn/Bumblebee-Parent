import 'package:flutter/material.dart';

class ClassListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Class List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
             
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Add functionality here
            },
          ),
        ],
        backgroundColor: Colors.white, 
        elevation: 1, 
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: Colors.grey[200],
            child: Text(
              'Available Classes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              itemCount: 2,
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: Colors.grey[300], 
              ),
              itemBuilder: (context, index) {
                final classNames = ['KG', 'Apple 1X2C'];
                return ListTile(
                  title: Text(
                    classNames[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                       
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  tileColor: Colors.white, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  onTap: () {
                    // Navigate to class details or action
                  },
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // Keep background white for a minimalist style
    );
  }
}
