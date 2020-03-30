import 'package:flutter/material.dart';
import 'package:med/BottomNavigationBar.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:med/SignUp.dart';
import 'package:med/loginpage.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
/*
  void initState() {
    super.initState();
    Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey);
  }
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color.fromARGB(255, 232, 56, 77), // Main Color
            accentColor: Color.fromARGB(255, 216, 27, 97),
            fontFamily: 'hpsimplified'),
        home: CustomSplash(
          imagePath: "images/app_logo.png",
          home: LoginPage(),
          animationEffect: 'top-down',
          backGroundColor: Color.fromARGB(255, 232, 56, 77),
          duration: 2500,
          type: CustomSplashType.StaticDuration,
        ));
  }
}
