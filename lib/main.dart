import 'package:flutter/material.dart';
import 'package:karya_garudahacks/screens/login_signup_screen.dart';
import 'package:karya_garudahacks/screens/home_screen.dart';

void main() {
  runApp(HomeScreen());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LogIn(),
    );
  }
}
