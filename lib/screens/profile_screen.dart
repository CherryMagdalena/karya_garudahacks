import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ///add databaseService
    bool followPressed = false;
    return Scaffold(
      backgroundColor: color4,
      //appBar: CustomAppbar(),
      //bottomNavigationBar: CustomBottomAppBar(),

      ///add streambuilder here (before return column)
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(///profile picture
                margin: EdgeInsets.all(20),
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  ///find icon!
                  /*image: DecorationImage(
                    image:
                  ),*/
                ),
              ),
              Column(
                children: <Widget>[
                  Text(//Name
                    'usernamePlaceholder',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  Container(height: 8.0),
                  Row(//Follower & following count
                    children: <Widget>[
                      Text('Following: 0'),
                      Text('  |  '),
                      Text('Followers: 0'),
                    ],
                  ),
                ],
              ),
              RaisedButton(//follow button
                color: followPressed ? color1 : color3,
                splashColor: followPressed ? color3 : color1,
                child: Center(
                  child: followPressed ? Text(
                      'Follow',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                  ) : Text(
                    'Following',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(//description
            width: 365,
            child: Text(
              'Hello!',
              textAlign: TextAlign.left,
            ),
          ),
          Container(height: 8.0),//spacing
          Container(//post and store
            height: 35,
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'POST',
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text(
                    'STORE',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          ///input filteredSearch ProfileListLink here!
        ],
      ),
    );
  }
}
