import 'package:flutter/material.dart';

class HealthSchemes extends StatefulWidget {
  @override
  _HealthSchemesState createState() => _HealthSchemesState();
}

class _HealthSchemesState extends State<HealthSchemes> {
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          title: const Text('Home Page'),
        ),
        body: Container(
          child: Center(
            child: Text("Health Schemes"),
          ),
        ),
      ),
    );
  }
}
