import 'package:flutter/material.dart';
import 'package:med/bloodbank.dart';
import 'package:med/diagnostic.dart';
import 'package:med/main.dart';
import 'package:med/maternal.dart';
import 'package:med/pharmacy.dart';
import 'package:med/quick_access.dart';
/*import 'package:med/src/global_bloc.dart';
import 'package:med/src/ui/homepage/homepage.dart';
import 'package:provider/provider.dart';*/
import 'package:med/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:med/schemes.dart';
import 'package:med/specialist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

void Home() {
  HomePage();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedCare'),
      ),
      drawer: Drawers(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        // padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Specialist()),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/hospital.png"),
                    height: 90,
                    width: 90,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        "Hospital ",
                        style:
                            TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
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
                    builder: (BuildContext context) => DiagnosticLab()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/pathology.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Diagnostic Lab ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Pharmacy()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/pharmacy.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Pharmacy ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => BloodBank()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/blood_bank.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Blood Bank ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HealthSchemes()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/schemes.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Health Schemes ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MaternalCare()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/maternity.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Maternity ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
