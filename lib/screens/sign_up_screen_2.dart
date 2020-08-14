import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/services/database.dart';
import 'package:karya_garudahacks/model/user.dart';
import 'package:provider/provider.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color5, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color1, width: 2.0)
  ),
);

class SignUpData extends StatefulWidget {
  @override
  _SignUpDataState createState() => _SignUpDataState();
}

class _SignUpDataState extends State<SignUpData> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String name = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        backgroundColor: color2,
        title: Text('Just one step closer'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              //name input
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Name'),
                  validator: (val) => val.isEmpty ? 'Please enter your name' : null,
                  onChanged: (val) {setState(()=> name = val);}
              ),
              SizedBox(height: 20.0),
              //username input
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Username'),
                  validator: (val) => val.isEmpty ? 'Please enter your username' : null,
                  onChanged: (val) {setState(()=> username = val);}
              ),
              SizedBox(height: 20.0),
              //create account button
              StreamBuilder<UserData>(
                stream: DatabaseService(uid: user.uid).userData,
                builder: (context, snapshot) {
                  UserData userData = snapshot.data;
                  return  RaisedButton(
                    color: color1,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    onPressed: () async {
                      //navigate to next page
                      await DatabaseService(uid: user.uid).updateUserData(
                          name ?? userData.name,
                          username ?? userData.username);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
