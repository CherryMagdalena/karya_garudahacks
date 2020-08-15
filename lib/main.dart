import 'package:flutter/material.dart';
import 'package:karya_garudahacks/screens/login_signup_screen.dart';
import 'package:karya_garudahacks/screens/home_screen.dart';
import 'package:karya_garudahacks/services/auth.dart';
import 'package:karya_garudahacks/wrapper.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

void main() {
  runApp(MyApp());
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
      home: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
        ),
      )
    );
  }
}
