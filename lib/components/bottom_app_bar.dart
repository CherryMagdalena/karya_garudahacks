import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';

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
                  //To Shopping Page
                }),
            PageIcon(
                iconData: Icons.person,
                onPressed: () {
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
