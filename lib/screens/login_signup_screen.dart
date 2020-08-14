import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/services/auth.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: color5, width: 2.0)),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: color1, width: 2.0)),
);

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      body: Container(
        alignment: Alignment(0.0, 0.0),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              Image.asset('image/logo.png'),
              SizedBox(height: 10.0),
              //email input
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) =>
                    val.isEmpty ? 'Please enter your email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 10.0),
              //password input
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 8
                    ? 'Please enter a password with 8+ characters'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 10.0),
              //log in button
              RaisedButton(
                color: color1,
                child: Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPass(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Credentials do not match';
                      });
                    } else {} //navigate to homescreen
                  }
                  ;
                }, //authentication
              ),
              Text(
                '-or-',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              //sign up button
              RaisedButton(
                color: color1,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {}, //navigate to sign up page
              ),
              SizedBox(height: 10.0),
              Text(error)
            ],
          ),
        ),
      ),
    );
  }
}
