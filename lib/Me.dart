import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';
import 'package:med/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  String dropdownvalue = "A+ve";
  var _height = 0;
  var _weight = 0;
  var datavalue = "";
  var underweight = "";
  var check = 0;
  void BmiCalculate() {
    var value = _weight / pow(_height / 100, 2);
    setState(() {
      datavalue = value.toStringAsFixed(0);
    });
  }

  void OverAndUnder() {
    setState(() {
      if (int.parse(datavalue) >= 25) {
        underweight = "[ Overweight ]";
      } else if (int.parse(datavalue) >= 18.5) {
        underweight = "[ Normal ]";
      } else {
        underweight = "[ Underweight ]";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      drawer: Drawers(),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: new Container(
                width: 100,
                height: 100,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage("images/user.png")))),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("MedCare"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age (in years)',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _height = int.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Height (in cms)',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _weight = int.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Weight (in kgs)',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Text("BMI :-     "),
                Text(
                  datavalue + "    ",
                ),
                Text(
                  underweight,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Text("Blood Groups :-    "),
                DropdownButton<String>(
                    value: dropdownvalue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownvalue = newValue;
                      });
                    },
                    items: <String>[
                      "A+ve",
                      "A-ve",
                      "B+ve",
                      "B-ve",
                      "O+ve",
                      "O-ve",
                      "AB+ve",
                      "AB-ve"
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList())
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Emergency Contact',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  BmiCalculate();
                  OverAndUnder();
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              child: Text(
                "Save",
                style: TextStyle(
                  fontFamily: "hpsimplified",
                  color: Color.fromARGB(255, 232, 56, 77),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
