import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/home_screen.dart';
import 'package:karya_garudahacks/screens/purchase_home_screen.dart';
import 'package:karya_garudahacks/screens/setting_screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: color3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PageIcon(
                iconData: Icons.home,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  //To Home Page
                }),
            PageIcon(
                iconData: Icons.search,
                onPressed: () {
                  //To Search Page
                }),
            PageIcon(
                iconData: Icons.shopping_cart,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PurchaseHomeScreen()));
                }),
            PageIcon(
                iconData: Icons.person,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingScreen()));
                  //To Profile
                }),
          ],
        ));
  }
}

class PageIcon extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  PageIcon({this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      color: color1,
      onPressed: onPressed,
    );
  }
}
