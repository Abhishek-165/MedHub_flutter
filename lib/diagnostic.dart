import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class DiagnosticLab extends StatefulWidget {
  @override
  _DiagnosticLabState createState() => _DiagnosticLabState();
}

class _DiagnosticLabState extends State<DiagnosticLab> {
  String dropdownvalue = "Mumbai";
  final DBref = FirebaseDatabase.instance.reference().child("PathologyLab");
  var datas;
  var name = "";

  Future<List<Diagnostic>> _getValue() async {
    await DBref.once().then((DataSnapshot datasnapShot) {
      datas = datasnapShot.value;
    });
    List<Diagnostic> pharmas = [];

    Map map = datas;
    map.values.forEach((u) {
      if (dropdownvalue == u["Location"]) {
        Diagnostic diag = Diagnostic(u["Address"], u["Facilities"], u["Loc"],
            u["Location"], u["Name"], u["Phone"]);
        pharmas.add(diag);
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
                        child: SpinKitFadingCircle(
                          color: Colors.red,
                          size: 50,
                        ),
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
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text("Facilities",
                                              style: TextStyle(
                                                  fontFamily: 'hpsimplified',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 15, bottom: 15),
                                          child: Text(
                                            snapshot.data[index].Facilities,
                                            style: TextStyle(
                                                fontFamily: 'hpsimplified'),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class Diagnostic {
  final String Address;
  final String Facilities;
  final String Loc;
  final String Location;
  final String Name;
  final String Phone;

  Diagnostic(this.Address, this.Facilities, this.Loc, this.Location, this.Name,
      this.Phone);
}
