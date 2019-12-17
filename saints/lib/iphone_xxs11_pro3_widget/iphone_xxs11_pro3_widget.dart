import 'package:Saints/providers/globals.dart' as globals;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'dart:async';
import 'dart:convert';

class IPhoneXXS11Pro3Widget extends StatefulWidget {
  @override
  _IphoneXXS11Pro3WidgetState createState() => _IphoneXXS11Pro3WidgetState();
}

class _IphoneXXS11Pro3WidgetState extends State<IPhoneXXS11Pro3Widget> {
  Map data;
  String author;
  String quote;
  Icon _searchIcon = new Icon(Icons.search, color: Colors.white);
  Icon _calendarIcon = Icon(Icons.calendar_today, color: Colors.white, size: 35);
  Widget appBarTitle = new Text('Search Saints');
  final TextEditingController _searchField = new TextEditingController();

  // ignore: missing_return
  Future getQuote() async {
    var response = await http
        .get("https://us-central1-saints-3506b.cloudfunctions.net/api/quote");
    setState(() {
      var datum = json.decode(response.body);
      author = datum[0]['data']['author'];
      quote = datum[0]['data']['quote'];
    });
  }

  Future searchSaints() async {
    const url =
        "https://us-central1-saints-3506b.cloudfunctions.net/api/search";

    var response = await http.get("$url?author=${_searchField.text}");

    setState(() {
      var datum = json.decode(response.body);

      author = datum['data'][0]['author'];
      quote = datum['data'][0]['quote'];
    });
  }

  @override
  void initState() {
    super.initState();
    getQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Container(
            child: TextField(
              controller: _searchField,
              style: TextStyle(color: Colors.white),
              decoration: new InputDecoration(
                  hintText: 'Search Saints',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none),
            ),
            alignment: Alignment.centerRight,
          ),
          actions: <Widget>[
            IconButton(
              icon: _searchIcon,
              tooltip: 'Search Saints',
              onPressed: searchSaints,
            )
          ]),
      drawer: new Drawer(
          child: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(globals.userProfile['name']),
              accountEmail: new Text(globals.userProfile['email']),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage(
                    globals.userProfile["picture"]["data"]["url"]),
              ),
            ),
            new ListTile(
              title: new Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      )),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 144, 255),
          border: Border.all(
            color: Color.fromARGB(255, 112, 112, 112),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: IconButton(icon: _calendarIcon,
                  onPressed: () => Navigator.pushNamed(context, '/calendar'))
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 339,
                height: 390,
                margin: EdgeInsets.only(left: 12, top: 35),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 339,
                        height: 340,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Text(
                                "\"",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 100,
                                  letterSpacing: 3.4,
                                  fontFamily: "Engravers MT",
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Positioned(
                              top: 80,
                              child: Container(
                                width: 330,
                                child: AutoSizeText(
                                  quote.toString(),
                                  presetFontSizes: [35, 21, 16],
                                  maxLines: 10,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 26,
                                    letterSpacing: 0.884,
                                    fontFamily: "Roboto",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      top: 350,
                      child: Container(
                        width: 300,
                        child: AutoSizeText(
                          author.toString(),
                          presetFontSizes: [20, 14],
                          maxLines: 1,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            letterSpacing: 0.68,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 80,
              margin: EdgeInsets.only(left: 50, right: 50, bottom: 108),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 37,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset(
                              "assets/images/path-2.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: new GestureDetector(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 43,
                                margin: EdgeInsets.only(left: 18),
                                child: Image.asset(
                                  "assets/images/group-1.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Share
                        onTap: () => share(context),
                      )),
                  Spacer(),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: new GestureDetector(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => getQuote(),
                                child: Container(
                                  width: 40,
                                  height: 43,
                                  margin: EdgeInsets.only(left: 18),
                                  child: Image.asset(
                                    "assets`images/refresh.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Share
                        onTap: () => share(context),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void share(BuildContext context) {
  final RenderBox box = context.findRenderObject();
  // QUOTE to be shared can be passed here
  Share.share(
      "If we pray we believe; If we believe, we will love; If we love, we will serve.   -Mother Theresa",
      subject: 'Saints Quotes',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
