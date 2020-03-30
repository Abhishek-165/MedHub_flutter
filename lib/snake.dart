import 'package:flutter/material.dart';

class SnakeBite extends StatefulWidget {
  @override
  _SnakeBiteState createState() => _SnakeBiteState();
}

class _SnakeBiteState extends State<SnakeBite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white, // Main Color,
          accentColor: Color.fromARGB(255, 216, 27, 97),
          fontFamily: 'hpsimplified'),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 232, 56, 77),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          title: Text("Snake Bite"),
        ),
      ),
    );
  }
}
