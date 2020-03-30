import 'package:flutter/material.dart';
import 'package:med/Hosp.dart';

class Specialist extends StatefulWidget {
  @override
  _SpecialistState createState() => _SpecialistState();
}

class _SpecialistState extends State<Specialist> {
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
          title: const Text('Hospital'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 20, left: 5),
                child: Text(
                  "Select Specialist : -",
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: ListTile.divideTiles(context: context, tiles: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Hosp("Cardiologist")),
                        );
                      },
                      leading: new Tab(
                        icon: new Image.asset(
                          "images/Cardiologist.png",
                        ),
                      ),
                      title: Text("Cardiologist"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Hosp("Dentist")),
                        );
                      },
                      leading: new Tab(
                        icon: new Image.asset(
                          "images/Dentist.png",
                        ),
                      ),
                      title: Text("Dentist"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Hosp("ENT")),
                        );
                      },
                      leading: new Tab(
                        icon: new Image.asset(
                          "images/Ent.png",
                        ),
                      ),
                      title: Text("ENT"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Hosp("Gynaecologist")),
                        );
                      },
                      leading: new Tab(
                        icon: new Image.asset(
                          "images/Gyno.png",
                        ),
                      ),
                      title: Text("Gynaecologist"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Hosp("Neurologist")),
                        );
                      },
                      leading: new Tab(
                        icon: new Image.asset(
                          "images/neurologist.png",
                        ),
                      ),
                      title: Text("Neurologist"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Hosp("Oncologist")),
                        );
                      },
                      leading: new Tab(
                        icon: new Image.asset(
                          "images/Onco.png",
                        ),
                      ),
                      title: Text("Oncologist"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Hosp("Gastroenterologists")),
                        );
                      },
                      leading: new Tab(
                        icon: new Image.asset(
                          "images/Gast.png",
                        ),
                      ),
                      title: Text("Gastroenterologists"),
                    ),
                  ]).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
