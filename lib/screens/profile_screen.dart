import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/model/user.dart';
import 'package:karya_garudahacks/services/database.dart';
import 'package:provider/provider.dart';
import 'package:karya_garudahacks/components/filtered_search.dart';



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    ///add databaseService
    bool followPressed = false;
    return Scaffold(
        backgroundColor: color4,
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
        ///add streambuilder here (before return column)
        body: StreamBuilder(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            UserData userData = snapshot.data;
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(///profile picture
                      margin: EdgeInsets.all(20),
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        ///find icon! upload default profpic to firebase
                        image: DecorationImage(
                          image: NetworkImage('gs://karya-43846.appspot.com/Chrysanthemum.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(//Name
                          userData.username,
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
                   Container(),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ProfileScreenPosts(userData.username),
              ],
            );
          },
        ));

  }
}


bool followPressed = false;
class TheirProfileScreen extends StatefulWidget {
  TheirProfileScreen(this.who);
  String who;
  @override
  _TheirProfileScreenState createState() => _TheirProfileScreenState();
}

class _TheirProfileScreenState extends State<TheirProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color4,
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
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
                        ///find icon! upload default profpic to firebase
                        image: DecorationImage(
                          image: NetworkImage('gs://karya-43846.appspot.com/Chrysanthemum.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(//Name
                          widget.who,
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
                    color: followPressed ? color3 : color1,
                    splashColor: followPressed ? color1 : color3,
                      child: Center(
                        child: followPressed ? Text(
                        'Following',
                        style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        ) ,
                        ) : Text(
                        'Follow',
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        ),
                      ),
                    ),
                    onPressed: (){///on pressed!
                      setState((){
                        followPressed = !followPressed;
                        }
                      );
                    },
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ProfileScreenPosts(widget.who),
              ],
            ),
          );
  }
}
