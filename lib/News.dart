import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:med/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Future<List<NewsGetter>> _getValue() async {
    var url = await http.get(
        "http://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=e8dc5d8e271d4415bf89b00d9dfa142c");

    List<NewsGetter> news = [];

    var jsonData = json.decode(url.body);
    var check = 0;
    Map map = jsonData;
    map.forEach((k, v) {
      if (k == "status" && v == "ok" || check == 1) {
        check = 1;
        if (k == "articles") {
          for (var x in v) {
            Map s = x;
            if (s["title"] != null &&
                s["url"] != null &&
                s["urlToImage"] != null &&
                s.containsKey("urlToImage") &&
                s.containsKey("url")) {
              if (s["author"] == null) {
                NewsGetter n =
                    NewsGetter(s["urlToImage"], s["url"], s["title"], " ");
                news.add(n);
              } else {
                NewsGetter n = NewsGetter(
                    s["urlToImage"], s["url"], s["title"], s["author"]);
                news.add(n);
              }
            }
          }
        }
      }
    });

    return news;
  }

  _launchURL(var link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 232, 56, 77), // Main Color,
          accentColor: Color.fromARGB(255, 216, 27, 97),
          fontFamily: 'hpsimplified'),
      home: Scaffold(
          appBar: AppBar(
            title: Text("News"),
          ),
          drawer: Drawers(),
          body: Container(
            child: FutureBuilder(
                future: _getValue(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                          child: SpinKitFadingCircle(
                            color: Colors.red,
                            size: 50,
                      )),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onTap: () {
                                _launchURL(snapshot.data[index].url);
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Image.network(
                                            snapshot.data[index].urlToImage),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 175, left: 8),
                                          child: Text(
                                            snapshot.data[index].author,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                snapshot.data[index].title,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'hpsimplified'),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          )),
    );
  }
}

class NewsGetter {
  final String urlToImage;
  final String url;
  final String title;
  final String author;

  NewsGetter(this.urlToImage, this.url, this.title, this.author);
}
