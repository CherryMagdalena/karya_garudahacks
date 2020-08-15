//order success screen

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/screens/home_screen.dart';
import 'package:karya_garudahacks/model/colors.dart';

class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
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
                const EdgeInsets.all(45.0),
                child: Text('SUCCESSFULLY PLACED ORDER',
                  style: TextStyle(
                    color: color1,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Icon(Icons.check_circle_outline,
              size: 150.0,
                color: color1,
              ),
            )
          ]
        ),
      ),

    );
  }
}
