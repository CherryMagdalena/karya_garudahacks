import 'package:flutter/material.dart';
import 'package:karya_garudahacks/screens/home_screen.dart';
import 'package:karya_garudahacks/screens/login_signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:karya_garudahacks/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null){
      return LogIn();
    } else {
      return HomeScreen();
    }
  }
}
