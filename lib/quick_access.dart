import 'package:flutter/material.dart';
import 'package:med/bone.dart';
import 'package:med/burn.dart';
import 'package:med/heartAttack.dart';
import 'package:med/main.dart';
import 'package:med/snake.dart';

class QuickAccess extends StatefulWidget {
  @override
  _QuickAccessState createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 232, 56, 77), // Main Color
          accentColor: Color.fromARGB(255, 216, 27, 97),
          fontFamily: 'hpsimplified'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          title: Text("Quick Access"),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 50,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 160),
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SnakeBite()),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/snake.png"),
                        height: 90,
                        width: 90,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            "Snake Bite ",
                            style: TextStyle(
                                fontFamily: 'hpsimplified', fontSize: 16),
                          )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Burn()),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/fire.png"),
                        height: 90,
                        width: 90,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            "Burns ",
                            style: TextStyle(
                                fontFamily: 'hpsimplified', fontSize: 16),
                          )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => BoneFracture()),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/bone.png"),
                        height: 90,
                        width: 90,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            "Bone Fracture ",
                            style: TextStyle(
                                fontFamily: 'hpsimplified', fontSize: 16),
                          )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HeartAttack()),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/heartattack.png"),
                        height: 90,
                        width: 90,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            "Heart Attack ",
                            style: TextStyle(
                                fontFamily: 'hpsimplified', fontSize: 16),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
