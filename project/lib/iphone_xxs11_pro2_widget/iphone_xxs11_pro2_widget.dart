
import 'package:flutter/material.dart';


class IPhoneXXS11Pro2Widget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 259,
              bottom: 128,
              child: Container(
                width: 328,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 326,
                        child: Text(
                          "Hi There,\nWelcome to Prayers!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 83, 91, 255),
                            fontSize: 30,
                            letterSpacing: 1.02,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 328,
                        height: 3,
                        margin: EdgeInsets.only(top: 97),
                        child: Image.asset(
                          "assets/images/path-1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 326,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 91, 255),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(82, 0, 0, 0),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 55,
                              child: Container(
                                width: 1,
                                height: 1,
                                child: Image.asset(
                                  "assets/images/pressed.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                            Positioned(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                  letterSpacing: 0.68,
                                  fontFamily: "Roboto",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                width: 326,
                child: Text(
                  "Mobile Number\n| +91 0977 603 1571",
                  style: TextStyle(
                    color: Color.fromARGB(255, 83, 91, 255),
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
    );
  }
}