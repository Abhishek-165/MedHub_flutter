import 'package:flutter/material.dart';

class Burn extends StatefulWidget {
  @override
  _BurnState createState() => _BurnState();
}

class _BurnState extends State<Burn> {
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
          title: Text("Fire Burn"),
        ),
      ),
    );
  }
}
