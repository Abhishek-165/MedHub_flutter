import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med/hospdetail.dart';
import 'package:url_launcher/url_launcher.dart';

class Hosp extends StatefulWidget {
  final String speciality;

  Hosp(this.speciality);

  @override
  _HospState createState() => _HospState();
}

class _HospState extends State<Hosp> {
  String dropdownvalue = "Mumbai";
  final DBref = FirebaseDatabase.instance.reference().child("Hospital");

  var datas;

  var name = "";

  _launchCaller(var phoneno) async {
    var url = "tel:$phoneno";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL(var link) async {
    var url = link;
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

  Future<List<Hosps>> _getValue() async {
    await DBref.child(dropdownvalue).once().then((DataSnapshot datasnapShot) {
      datas = datasnapShot.value;
    });
    List<Hosps> hosp = [];

    Map map = datas;
    map.values.forEach((u) {
      if (widget.speciality == "Cardiologist" &&
          u["Cardiologist"] == 1 &&
          dropdownvalue == u["Location"]) {
        Hosps hsp = Hosps(
            u["About"],
            u["Address"],
            u["Contact"],
            u["Facilities"],
            u["Loc"],
            u["Location"],
            u["Name"],
            u["Photo"],
            u["Website"]);
        hosp.add(hsp);
      } else if (widget.speciality == "Dentist" &&
          u["Dentist"] == 1 &&
          dropdownvalue == u["Location"]) {
        Hosps hsp = Hosps(
            u["About"],
            u["Address"],
            u["Contact"],
            u["Facilities"],
            u["Loc"],
            u["Location"],
            u["Name"],
            u["Photo"],
            u["Website"]);
        hosp.add(hsp);
      } else if (widget.speciality == "Gastroenterologists" &&
          u["Gastroenterologists"] == 1 &&
          dropdownvalue == u["Location"]) {
        Hosps hsp = Hosps(
            u["About"],
            u["Address"],
            u["Contact"],
            u["Facilities"],
            u["Loc"],
            u["Location"],
            u["Name"],
            u["Photo"],
            u["Website"]);
        hosp.add(hsp);
      } else if (widget.speciality == "Gynaecologist" &&
          u["Gynaecologist"] == 1 &&
          dropdownvalue == u["Location"]) {
        Hosps hsp = Hosps(
            u["About"],
            u["Address"],
            u["Contact"],
            u["Facilities"],
            u["Loc"],
            u["Location"],
            u["Name"],
            u["Photo"],
            u["Website"]);
        hosp.add(hsp);
      } else if (widget.speciality == "ENT" &&
          u["ent"] == 1 &&
          dropdownvalue == u["Location"]) {
        Hosps hsp = Hosps(
            u["About"],
            u["Address"],
            u["Contact"],
            u["Facilities"],
            u["Loc"],
            u["Location"],
            u["Name"],
            u["Photo"],
            u["Website"]);
        hosp.add(hsp);
      } else if (widget.speciality == "Neurologist" &&
          u["Neurologist"] == 1 &&
          dropdownvalue == u["Location"]) {
        Hosps hsp = Hosps(
            u["About"],
            u["Address"],
            u["Contact"],
            u["Facilities"],
            u["Loc"],
            u["Location"],
            u["Name"],
            u["Photo"],
            u["Website"]);
        hosp.add(hsp);
      } else if (widget.speciality == "Oncologist" &&
          u["Oncologist"] == 1 &&
          dropdownvalue == u["Location"]) {
        Hosps hsp = Hosps(
            u["About"],
            u["Address"],
            u["Contact"],
            u["Facilities"],
            u["Loc"],
            u["Location"],
            u["Name"],
            u["Photo"],
            u["Website"]);
        hosp.add(hsp);
      }

      /*if (dropdownvalue == u["Location"]) {
        Hosps hsp = Hosps(u["Contact"], u["Loc"], u["Location"], u["Name"],
            u["Photo"], u["Website"]);
        hosp.add(hsp);
      }*/
    });

    return hosp;
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
          title: const Text('Specialist'),
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
                        "Chennai",
                        "Navi Mumbai",
                        "Pune",
                        "Thiruvananthapuram",
                        "Hyderabad",
                        "Udupi"
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
                              padding: const EdgeInsets.only(
                                  top: 16.0,
                                  bottom: 0,
                                  left: 16.0,
                                  right: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HospitalDetail(snapshot.data[index],
                                                widget.speciality)),
                                  );
                                },
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image.network(snapshot.data[index].Photo),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: SizedBox(
                                              width: (MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.65) -
                                                  72,
                                              child: Text(
                                                  snapshot.data[index].Name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 16)),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.language),
                                            color: Color.fromARGB(
                                                255, 232, 56, 77),
                                            onPressed: () {
                                              _launchURL(
                                                  snapshot.data[index].Website);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.phone),
                                            color: Color.fromARGB(
                                                255, 232, 56, 77),
                                            onPressed: () {
                                              _launchCaller(
                                                  snapshot.data[index].Contact);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.location_on),
                                            color: Color.fromARGB(
                                                255, 232, 56, 77),
                                            onPressed: () {
                                              openMap(snapshot.data[index].Loc);
                                            },
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        child: Text(
                                            snapshot.data[index].Location,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                    ],
                                  ),
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

class Hosps {
  final String Contact;
  final String Loc;
  final String Location;
  final String Name;
  final String Photo;
  final String Website;
  final String Address;
  final String About;
  final String Facilities;

  Hosps(this.About, this.Address, this.Contact, this.Facilities, this.Loc,
      this.Location, this.Name, this.Photo, this.Website);
}
