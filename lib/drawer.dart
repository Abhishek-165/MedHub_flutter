import 'package:flutter/material.dart';
import 'package:med/BottomNavigationBar.dart';
import 'package:med/ambulance.dart';
import 'package:med/main.dart';
import 'package:med/quick_access.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:med/loginpage.dart';

class Drawers extends StatefulWidget {
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abhishek Dixit"),
              accountEmail: Text("codeblooded.io@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bottom()),
                );
              },
            ),
            ListTile(
                leading: new Tab(
                    icon: new Image.asset(
                  "images/siren.png",
                  color: Colors.grey[600],
                )),
                title: Text('Ambulance'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Ambulance()),
                  );
                }),
            ListTile(
              leading: new Tab(
                icon: new Image.asset(
                  "images/appointment_statrus.png",
                  color: Colors.grey[600],
                ),
              ),
              title: Text('Appointment Status'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: new Tab(
                icon: new Image.asset(
                  "images/history.png",
                  color: Colors.grey[600],
                ),
              ),
              title: Text('Appointment History'),
              onTap: () {},
            ),
            ListTile(
              leading: new Tab(
                icon: new Image.asset(
                  "images/chat.png",
                  color: Colors.grey[600],
                ),
              ),
              title: Text('MedBot'),
              onTap: () {
                //   Navigator.pop(context);
              },
            ),
            ListTile(
                leading: new Tab(
                  icon: new Image.asset(
                    "images/quick.png",
                    color: Colors.grey[600],
                  ),
                ),
                title: Text('Quick Access'),
                onTap: () {
                  Navigator.pop(context);
                  // close drawer before navigate to another page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuickAccess()),
                  );
                }),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey[600],
            ),
            ListTile(
              title: Text("Communicate"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text("Feedback"),
              onTap: () {},
            ),
            ListTile(
              leading: new Tab(
                icon: new Image.asset(
                  "images/about_us.png",
                  color: Colors.grey[600],
                ),
              ),
              title: Text("About Us"),
              onTap: () {},
            ),
            ListTile(
              leading: new Tab(
                icon: new Image.asset(
                  "images/logout.png",
                  color: Colors.grey[600],
                ),
              ),
              title: Text("Sign Out"),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()),
                  );
                }).catchError((e) {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
