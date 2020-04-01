import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodBank extends StatefulWidget {
  @override
  _BloodBankState createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  String dropdownvalue = "Mumbai";
  final DBref = FirebaseDatabase.instance.reference().child("BloodBank");
  var datas;
  var name = "";

  Widget getIcon(data) {
    if (data > 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: new Tab(
          icon: new Image.asset(
            "images/Available.png",
            height: 20,
            width: 20,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: new Tab(
          icon: new Image.asset(
            "images/NonAvailable.png",
            height: 20,
            width: 20,
          ),
        ),
      );
    }
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

  Future<List<BloodBankDetail>> _getValue() async {
    await DBref.once().then((DataSnapshot datasnapShot) {
      datas = datasnapShot.value;
    });
    List<BloodBankDetail> BloodBankFinalList = [];

    Map map = datas;
    map.values.forEach((u) {
      if (dropdownvalue == u["Place"]) {
        BloodBankDetail BloodBankObj = BloodBankDetail(
          u["ABneg"],
          u["ABpos"],
          u["Address"],
          u["Aneg"],
          u["Apos"],
          u["Bneg"],
          u["Bpos"],
          u["Link"],
          u["Name"],
          u["Oneg"],
          u["Opos"],
          u["Phone"],
        );
        BloodBankFinalList.add(BloodBankObj);
      }
    });

    return BloodBankFinalList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 232, 56, 77), // Main Color
          accentColor: Color.fromARGB(255, 216, 27, 97),
          fontFamily: 'hpsimplified',
          dividerColor: Colors.white),
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
                        "Bangalore",
                        "Alappuzha",
                        "Mysore",
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
                                  top: 16, left: 16, right: 16),
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
                                            openMap(snapshot.data[index].Link);
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
                                    Theme(
                                      data: ThemeData(
                                          primaryColor:
                                          Color.fromARGB(255, 232, 56, 77),
                                          accentColor:
                                          Color.fromARGB(255, 232, 56, 77),
                                          dividerColor: Colors.white),
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: ExpansionTile(
                                          children: <Widget>[
                                            DataTable(
                                              columnSpacing: 10,
                                              headingRowHeight: 25,
                                              columns: [
                                                DataColumn(
                                                    label: Text("Blood Group",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold))),
                                                DataColumn(
                                                    label: Text("Availability",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold))),
                                                DataColumn(
                                                    label: Text("Unit",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)))
                                              ],
                                              rows: [
                                                DataRow(cells: [
                                                  DataCell(Text("A+ve",
                                                      style: TextStyle(
                                                          fontSize: 14))),
                                                  DataCell(getIcon(snapshot
                                                      .data[index].Apos)),
                                                  DataCell(Text(
                                                      snapshot.data[index].Apos
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(Text("A-ve",
                                                      style: TextStyle(
                                                          fontSize: 14))),
                                                  DataCell(getIcon(snapshot
                                                      .data[index].Aneg)),
                                                  DataCell(Text(
                                                      snapshot.data[index].Aneg
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(Text("B+ve",
                                                      style: TextStyle(
                                                          fontSize: 14))),
                                                  DataCell(getIcon(snapshot
                                                      .data[index].Bpos)),
                                                  DataCell(Text(
                                                      snapshot.data[index].Bpos
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(Text("B-ve",
                                                      style: TextStyle(
                                                          fontSize: 14))),
                                                  DataCell(getIcon(snapshot
                                                      .data[index].Bneg)),
                                                  DataCell(Text(
                                                      snapshot.data[index].Bneg
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(Text("O+ve",
                                                      style: TextStyle(
                                                          fontSize: 14))),
                                                  DataCell(getIcon(snapshot
                                                      .data[index].Opos)),
                                                  DataCell(Text(
                                                      snapshot.data[index].Opos
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(Text("O-ve",
                                                      style: TextStyle(
                                                          fontSize: 14))),
                                                  DataCell(getIcon(snapshot
                                                      .data[index].Oneg)),
                                                  DataCell(Text(
                                                      snapshot.data[index].Oneg
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(Text("AB+ve",
                                                      style: TextStyle(
                                                          fontSize: 14))),
                                                  DataCell(getIcon(snapshot
                                                      .data[index].ABpos)),
                                                  DataCell(Text(
                                                      snapshot.data[index].ABpos
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(Text(
                                                    "AB-ve",
                                                    style:
                                                    TextStyle(fontSize: 14),
                                                  )),
                                                  DataCell(getIcon(snapshot
                                                      .data[index].ABneg)),
                                                  DataCell(Text(
                                                      snapshot.data[index].ABneg
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                                ])

                                                //DataRow(cells: [DataCell(),DataCell(),DataCell(),])
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
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

class BloodBankDetail {
  final int ABneg;
  final int ABpos;
  final String Address;
  final int Aneg;
  final int Apos;
  final int Bneg;
  final int Bpos;
  final String Link;
  final String Name;
  final int Oneg;
  final int Opos;
  final String Phone;

  BloodBankDetail(this.ABneg,
      this.ABpos,
      this.Address,
      this.Aneg,
      this.Apos,
      this.Bneg,
      this.Bpos,
      this.Link,
      this.Name,
      this.Oneg,
      this.Opos,
      this.Phone);
}
