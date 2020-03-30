import 'package:flutter/material.dart';
import 'package:med/News.dart';
import 'package:med/Me.dart';
import 'package:med/HealthCamps.dart';
import 'package:med/Remainder.dart';
import 'package:med/HomePage.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    News(),
    Remainder(),
    HomePage(),
    HealthCamps(),
    Me(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 232, 56, 77),
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 232, 56, 77)),
        unselectedIconTheme: IconThemeData(color: Colors.grey[500]),
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.subtitles), title: Text("News")),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("Remainder")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_convenience_store),
              title: Text("Health Camps")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Me")),
        ],
      ),
    );
  }
}
