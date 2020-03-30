import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:med/loginpage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white, // Main Color,
          accentColor: Color.fromARGB(255, 216, 27, 97),
          fontFamily: 'hpsimplified'),
      home: Center(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 232, 56, 77),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            title: Text("Sign Up"),
          ),
          body: Container(
            color: Color.fromARGB(255, 232, 56, 77),
            padding: EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Text("MedCare",
                    style: TextStyle(
                        fontFamily: 'hpsimplified',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: TextField(
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
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                      obscureText: false,
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
                Center(
                    child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    minWidth: 250,
                    height: 40,
                    child: RaisedButton(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: Colors.white,
                      onPressed: () {
                        print(_email);
                        print(_password);
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((value) {
                          setState(() {
                            _email = "";
                            _password = "";
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => LoginPage()),
                          );
                        }).catchError((e) {
                          Fluttertoast.showToast(
                              msg: "Account Already Exists",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.red,
                              fontSize: 16.0);
                        });
                      },
                      textColor: Color.fromARGB(255, 232, 56, 77),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
