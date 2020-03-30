import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med/drawer.dart';

class HealthCamps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Camps"),
      ),
      drawer: Drawers(),
      body: Center(
        child: Text("Health Section"),
      ),
    );
  }
}
