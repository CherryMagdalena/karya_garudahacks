import 'package:flutter/material.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/components/filtered_search.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(height: 9,), //spacing
            Container(
              width: 320,
              height: 25,
              color: color4,
              child: Center(
                child: Text(
                  'Search for something...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(height:9,), //spacing
            Text(
              'Sort by: New/Popular',
              textAlign: TextAlign.left,
            ),
            Container(height:9,), //spacing

            //trio buttons
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(6),
                  width: 8,
                  height: 8,
                  decoration: roundButton(),
                ),
                Container(
                  width: 120,
                  child: Text(
                    'All Posts',
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  width: 8,
                  height: 8,
                  decoration: roundButton(),
                ),
                Container(
                  width: 120,
                  child: Text(
                    'Not for Sale',
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  width: 8,
                  height: 8,
                  decoration: roundButton(),
                ),
                Container(
                  width: 102,
                  child: Text(
                    'Sale only',
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Container(height:12,), //spacing
            SearchScreenPosts(),
          ],
        ),
      ),
    );
  }
}

BoxDecoration roundButton(){
  return BoxDecoration(
    border: Border.all(
      width:1,
      color: Colors.black,
    ),
    shape: BoxShape.circle,
    color: Colors.white,
  );
}