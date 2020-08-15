import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:karya_garudahacks/screens/sign_up_screen_2.dart';
import 'package:karya_garudahacks/services/auth.dart';
import 'login_signup_screen.dart';
import 'package:karya_garudahacks/components/loading.dart';

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

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        backgroundColor: color2,
        elevation:  0.0,
        title: Text('Sign up to Karya'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              //email input
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Please enter your email' : null,
                onChanged: (val) {setState(()=> email = val);}
              ),
              SizedBox(height: 20.0),
              //password input
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 8 ? 'Please enter a password with 8+ characters' : null,
                  onChanged: (val) {setState(()=> password = val);}
              ),
              //next button to navigate to the next page
              RaisedButton(
                color: color1,
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0
                  ),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPass(email ,password);
                    if(result == null){
                      setState(() {
                          loading = false;
                        error = 'Please insert the correct type of data required';
                      });
                    } else {
                      //navigate to next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>SignUpData())
                      );
                    }
                  }
                },
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black45, fontSize: 15),
                  children: [
                    TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                            color: color2,
                            fontWeight: FontWeight.bold
                        )
                      ),
                    TextSpan(
                      text: ' Sign In',
                      style: TextStyle(
                        color: color1,
                        fontWeight: FontWeight.bold
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => LogIn(),
                    )
                  ]
                ),
              ),
              SizedBox(height: 20.0),
              Text(error)
            ],
          ),
        ),
      ),
    );
  }
}
