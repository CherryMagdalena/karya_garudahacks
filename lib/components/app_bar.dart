import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/shopping_basket.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  CustomAppBar({this.height = kToolbarHeight, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      iconTheme: IconThemeData(color: color1),
      backgroundColor: color3,
      elevation: 0,
      automaticallyImplyLeading: true,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 0.5),
          child: IconButton(
            icon: Icon(Icons.shopping_basket),
            color: color1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingBasket()),
              );
            },
          ),
        ),
        Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                //To chatting page
              },
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
