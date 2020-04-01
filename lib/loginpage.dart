import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:med/SignUp.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'BottomNavigationBar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  bool showSpinner = false;

/*
  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }
*/

  @override
  void showToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white, // Main Color,
          accentColor: Color.fromARGB(255, 216, 27, 97),
          fontFamily: 'hpsimplified'),
      home: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
              color: Color.fromARGB(255, 232, 56, 77),
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: TypewriterAnimatedTextKit(
                      text: ["MedCare"],
                      speed: Duration(milliseconds: 1500),
                      totalRepeatCount: 1,
                      textStyle: TextStyle(
                          fontFamily: 'hpsimplified',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          icon: Icon(Icons.person),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: TextField(
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          fillColor: Colors.white,
                          icon: Icon(Icons.lock),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 170, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        showToast();
                      },
                      child: Text(
                        "forgot password?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 5, top: 20),
                          child: ButtonTheme(
                            minWidth: 250,
                            height: 40,
                            child: RaisedButton(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)),
                              color: Colors.white,
                              onPressed: () async {
                                if (_email != null && _password != null) {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                      email: _email, password: _password)
                                      .then((value) {
                                    setState(() {
                                      _email = "";
                                      _password = "";
                                      showSpinner = false;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Bottom()),
                                    );
                                  }).catchError((e) {
                                    setState(() {
                                      showSpinner = false;
                                    });
                                    Fluttertoast.showToast(
                                        msg: "Email or Password is Invalid",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIos: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.red,
                                        fontSize: 16.0);
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Email and Password is required",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIos: 1,
                                      backgroundColor: Colors.white,
                                      textColor: Colors.red,
                                      fontSize: 16.0);
                                }
                              },
                              textColor: Color.fromARGB(255, 232, 56, 77),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 220),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              child: Text(
                                "Or SignUp",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "hpsimplified"),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUpPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
