import 'package:flutter/material.dart';

import 'package:Saints/providers/globals.dart' as globals;

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: new AppBar(
         centerTitle: true,
         title: new Text('Saints'),
         ),
      drawer: new Drawer(
        child: Container (
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
                Navigator.pushNamed(context, "/home");    
              },
            ),
          ],
        ),
        )
      ),
      body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.blue.withOpacity(0.5)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/mask-group-2-2.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 90.0),
                Text(
                  'Mother Theresa',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Saints',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 25.0),
                // Container(
                //     height: 30.0,
                //     width: 95.0,
                //     child: Material(
                //       borderRadius: BorderRadius.circular(20.0),
                //       shadowColor: Colors.greenAccent,
                //       color: Colors.green,
                //       elevation: 7.0,
                //       child: GestureDetector(
                //         onTap: () {},
                //         child: Center(
                //           child: Text(
                //             'Edit Name',
                //             style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                //           ),
                //         ),
                //       ),
                //     )),
                    SizedBox(height: 25.0),
                // Container(
                //     height: 30.0,
                //     width: 95.0,
                //     child: Material(
                //       borderRadius: BorderRadius.circular(20.0),
                //       shadowColor: Colors.redAccent,
                //       color: Colors.red,
                //       elevation: 7.0,
                //       child: GestureDetector(
                //         onTap: () {},
                //         child: Center(
                //           child: Text(
                //             'Log out',
                //             style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                //           ),
                //         ),
                //       ),
                //     ))
              ],
            ))
      ],
    ));
  }
}
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 195, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}