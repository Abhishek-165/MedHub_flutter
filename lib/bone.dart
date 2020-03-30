import 'package:flutter/material.dart';

class BoneFracture extends StatefulWidget {
  @override
  _BoneFractureState createState() => _BoneFractureState();
}

class _BoneFractureState extends State<BoneFracture> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white, // Main Color,
          accentColor: Color.fromARGB(255, 216, 27, 97),
          fontFamily: 'hpsimplified'),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 232, 56, 77),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          title: Text("Bone Fracture"),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Text(
                "What to do?",
                style: TextStyle(
                    fontFamily: 'hpsimplified',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 92, 91, 87)),
              ),
              Text("Stop Any bleeding"),
              Text("Immobolize the injured area."),
              Wrap(
                children: <Widget>[
                  Text("Apply ice Packs to limit swelling and help relive pain")
                ],
              ),
              Text("Treat for shock")
            ],
          ),
        ),
      ),
    );
  }
}
