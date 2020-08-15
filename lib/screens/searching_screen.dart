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
  String _radioButtonSelection = 'All Post';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: 320,
              height: 35,
              color: color4,
              child: Center(
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 25, 0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  Text(
                    'Search for something...',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              height: 9,
            ), //spacing
//            Text(
//              'Sort by: New/Popular',
//              textAlign: TextAlign.left,
//            ),
            Container(
              height: 9,
            ), //spacing

            //trio buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Radio(
                          groupValue: _radioButtonSelection,
                          value: 'All post',
                          onChanged: (value) {
                            setState(() {
                              _radioButtonSelection = value;
                            });
                          }),
                      Text(
                        'All post',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                          groupValue: _radioButtonSelection,
                          value: 'Not for sale',
                          onChanged: (value) {
                            setState(() {
                              _radioButtonSelection = value;
                            });
                          }),
                      Text(
                        'Not for sale',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                          groupValue: _radioButtonSelection,
                          value: 'Sale only',
                          onChanged: (value) {
                            setState(() {
                              _radioButtonSelection = value;
                            });
                          }),
                      Text(
                        'Sale only',
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 9,
            ), //spacing
            SearchScreenPosts(),
          ],
        ),
      ),
    );
  }
}

BoxDecoration roundButton() {
  return BoxDecoration(
    border: Border.all(
      width: 1,
      color: Colors.black,
    ),
    shape: BoxShape.circle,
    color: Colors.white,
  );
}
