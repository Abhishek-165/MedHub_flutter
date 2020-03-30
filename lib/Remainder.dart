import 'package:flutter/material.dart';
import 'package:med/main.dart';
import 'package:med/drawer.dart';

class Remainder extends StatefulWidget {
  @override
  _RemainderState createState() => _RemainderState();
}

class _RemainderState extends State<Remainder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color.fromARGB(255, 232, 56, 77), // Main Color
            accentColor: Color.fromARGB(255, 216, 27, 97),
            fontFamily: 'hpsimplified'),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Remainder"),
          ),
          drawer: Drawers(),
        ));
  }
}
