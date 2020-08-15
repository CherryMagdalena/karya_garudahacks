//order success screen

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/screens/home_screen.dart';
import 'package:karya_garudahacks/model/colors.dart';

class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar:  AppBar(
          iconTheme: IconThemeData(color: color1),
          backgroundColor: color3,
          elevation: 0,
          automaticallyImplyLeading: true,
      ),
      body: MaterialButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          padding:
          const EdgeInsets.only(left: 60.0),
          child: Text('SUCCESSFULLY PLACED ORDER',
            style: TextStyle(
              color: color1,
              fontSize: 40,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      ),

    );
  }
}
