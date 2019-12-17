

import 'package:Saints/providers/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:Saints/providers/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class IPhoneXXS11Pro3Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
       appBar: new AppBar(
         centerTitle: true,
         title: new Text('Saints'),
         ),
      drawer: new Drawer(
        child: getWidget(context)
      ),
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
              alignment: Alignment.topLeft,
              child: Container(
                width: 339,
                height: 321,
                margin: EdgeInsets.only(left: 12, top: 84),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 339,
                        height: 321,
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
                              top: 94,
                              child: Container(
                                width: 326,
                                child: Text(
                                  "If we pray we believe;\nIf we believe, we will love;\nIf we love, we will serve;",
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
                            Positioned(
                              left: 11,
                              top: 271,
                              child: new GestureDetector(
                                  child: Container(
                                  width: 54,
                                  height: 50,
                                  child: Image.asset(
                                    "assets/images/mask-group-2-2.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, "/profile");    
                                }
                              )
                              
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 81,
                      top: 282,
                      child: Container(
                        width: 176,
                        child: Text(
                          "Mother Theresa",
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
              margin: EdgeInsets.only(left: 82, right: 82, bottom: 108),
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
                      onTap: () =>  share(context),
                    )
                  ),
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
  Share.share("If we pray we believe; If we believe, we will love; If we love, we will serve.   -Mother Theresa",
      subject: 'Saints Quotes',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
// Statement to know whether the Data of user is set, if not currently it returns a tester
Widget getWidget(context) {
  if (globals.userProfile == null) {
     return Container (
          alignment: Alignment.center,
          child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Tester'),
              accountEmail: new Text('tester@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage('assets/images/mask-group-2-2.png'),
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
        );
    
  } else {
    return Container (
          alignment: Alignment.center,
          child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(globals.userProfile['name']),
              accountEmail: new Text(globals.userProfile['email']),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage(globals.userProfile["picture"]["data"]["url"]),
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
        );
  }
}