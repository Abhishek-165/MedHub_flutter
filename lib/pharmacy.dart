import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'dart:collection';

class Pharmacy extends StatefulWidget {
  @override
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  String dropdownvalue = "Mumbai";
  final DBref = FirebaseDatabase.instance.reference().child("Pharmacy");
  var datas;
  var name = "";

  Future<List<Pharma>> _getValue() async {
    await DBref.once().then((DataSnapshot datasnapShot) {
      datas = datasnapShot.value;
    });
    List<Pharma> pharmas = [];

    Map map = datas;
    map.values.forEach((u) {
      if (dropdownvalue == u["Location"]) {
        Pharma pharm = Pharma(
            u["Address"],
            u["Aspirin"],
            u["Benadryl"],
            u["Generic"],
            u["Ibuprofen"],
            u["Lisinopril"],
            u["Loc"],
            u["Location"],
            u["Morphine"],
            u["Name"],
            u["Paracetamol"],
            u["Phone"],
            u["Sinarest"],
            u["Strepsil"],
            u["Vicks"],
            u["Vitamin C"]);
        pharmas.add(pharm);
      }
    });

    return pharmas;
  }

  _launchCaller(var phoneno) async {
    var url = "tel:$phoneno";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> openMap(var link) async {
    String googleUrl = link;
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 15,
                left: MediaQuery.of(context).size.width * 0.10,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 232, 56, 77),
                      style: BorderStyle.solid,
                      width: 1),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: DropdownButton<String>(
                      underline: SizedBox(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 232, 56, 77),
                          fontFamily: 'hpsimplified',
                          fontWeight: FontWeight.bold),
                      iconEnabledColor: Color.fromARGB(255, 232, 56, 77),
                      iconDisabledColor: Color.fromARGB(255, 232, 56, 77),
                      isExpanded: true,
                      value: dropdownvalue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownvalue = newValue;
                        });
                      },
                      items: <String>[
                        "Mumbai",
                        "Udupi",
                        "Alappuzha",
                        "Delhi",
                        "Hyderabad",
                        "Chandigarh",
                        "Ahmedabad",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, textAlign: TextAlign.right),
                        );
                      }).toList()),
                ),
              ),
            ),
            FutureBuilder(
                future: _getValue(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.25),
                      child: Center(
                        child: Text("Loading....."),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.70) -
                                                48,
                                            child: Text(
                                              snapshot.data[index].Name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.phone),
                                          color:
                                              Color.fromARGB(255, 232, 56, 77),
                                          onPressed: () {
                                            _launchCaller(
                                                snapshot.data[index].Phone);
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.location_on),
                                          color:
                                              Color.fromARGB(255, 232, 56, 77),
                                          onPressed: () {
                                            openMap(snapshot.data[index].Loc);
                                          },
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 5, 15, 15),
                                      child: Text(
                                        snapshot.data[index].Address,
                                        style: TextStyle(
                                            fontFamily: 'hpsimplified'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

class Pharma {
  final String Name;
  final String Loc;
  final String Address;
  final String Phone;
  final int Asprin;
  final int Benadryl;
  final int Ibuprofen;
  final int Generic;
  final int Lisinopril;
  final String Location;
  final int Morphine;
  final int Paracetamol;
  final int Sinarest;
  final int Strepsil;
  final int Vicks;
  final int Vitamin_C;

  Pharma(
      this.Address,
      this.Asprin,
      this.Benadryl,
      this.Generic,
      this.Ibuprofen,
      this.Lisinopril,
      this.Loc,
      this.Location,
      this.Morphine,
      this.Name,
      this.Paracetamol,
      this.Phone,
      this.Sinarest,
      this.Strepsil,
      this.Vicks,
      this.Vitamin_C);
}
