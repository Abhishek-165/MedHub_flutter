import 'package:flutter/material.dart';
import 'package:med/Hosp.dart';
import 'package:med/appointment.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetail extends StatelessWidget {
  final Hosps user;
  final String speciality;
  HospitalDetail(this.user, this.speciality);

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
          title: const Text('Hospitals'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 20, left: 16.0, right: 16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(user.Photo),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width:
                              (MediaQuery.of(context).size.width * 0.65) - 72,
                          child: Text(user.Name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.language),
                        color: Color.fromARGB(255, 232, 56, 77),
                        onPressed: () {
                          _launchURL(user.Website);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.phone),
                        color: Color.fromARGB(255, 232, 56, 77),
                        onPressed: () {
                          _launchCaller(user.Contact);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.location_on),
                        color: Color.fromARGB(255, 232, 56, 77),
                        onPressed: () {
                          openMap(user.Loc);
                        },
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(user.Address, style: TextStyle(fontSize: 16)),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text("About",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(user.About, style: TextStyle(fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text("Facilities",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child:
                        Text(user.Facilities, style: TextStyle(fontSize: 16)),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    BookAppointment(user.Name, speciality)),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        child: Text(
                          "Book an Appointment",
                          style: TextStyle(
                            fontFamily: "hpsimplified",
                            color: Color.fromARGB(255, 232, 56, 77),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
