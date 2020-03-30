import 'package:flutter/material.dart';

class BookAppointment extends StatefulWidget {
  final String name;
  final String speciality;

  BookAppointment(this.name, this.speciality);
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("User Profile"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Enter Your Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Mobile No',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Date',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Time',
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: FlatButton(
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
        )));
  }
}
