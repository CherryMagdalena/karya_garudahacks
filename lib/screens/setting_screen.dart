// Settings Screen, profile etc

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/screens/profile_screen.dart';
import 'package:karya_garudahacks/services/auth.dart';
import 'package:karya_garudahacks/services/database.dart';
import 'package:provider/provider.dart';
import 'package:karya_garudahacks/model/user.dart';

import 'login_signup_screen.dart';

class SettingScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    Column settings() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.people,
                    size: 40,
                  ),
                ),
                StreamBuilder(
                  stream: DatabaseService(uid:user.uid).userData,
                  builder: (context, snapshot){
                    UserData userData = snapshot.data;
                    return Text(
                      UserData == null ? '' : userData.username,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black87,
                      ),
                    );
                  }
                ),
              ]),
          _container('Profile', onClicked: () {
           //to profile screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen())
            );
          }),
          _container('My Post'),
          _container('Purchases'),
          _container('My Likes'),
          _container('Setting'),
          _container('Log Out', onClicked: () async {
            //log out
            await _auth.signOut();
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> LogIn())
            );
          }),
        ],
      );
    }

    return MaterialApp(
        home: Scaffold(
            backgroundColor: color4,
            bottomNavigationBar: CustomBottomAppBar(),
            appBar: CustomAppBar(),
            body: settings()));
  }

  GestureDetector _container(String label, {Function onClicked}) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: 200.0,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color2,
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
}