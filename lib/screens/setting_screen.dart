// Settings Screen, profile etc

import 'package:flutter/material.dart';

GestureDetector _container(String label, {Function onClicked}) {
  return GestureDetector(
    onTap: onClicked,
    child: Container(
      width: 200.0,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(

      ),
      child: Center(
        child: Text(
          label,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Row(
          children: [
            Icon(Icons.people,
            size:40,
            ),
            _container('Profile'),
            _container('My Post'),
            _container('Purchases'),
            _container('My Likes'),
            _container('Settings'),
            _container('Log Out'),
          ],


        ),
      ],
    );
  }
}
