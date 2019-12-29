
import 'package:flutter/material.dart';
import 'package:Saints/iphone_xxs11_pro2_widget/iphone_xxs11_pro2_widget.dart';


class IPhoneXXS11Pro1Widget extends StatelessWidget {
  
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
              left: -288,
              right: -554,
              child: Container(
                height: 812,
                child: Image.asset(
                  "assets/images/mask-group-1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 235,
              bottom: 128,
              child: Container(
                width: 326,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 326,
                        child: Text(
                          "Get\nInspiredEveryday",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 64,
                            letterSpacing: 2.176,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: new GestureDetector(
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
                                "Let's Go",
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
                         onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));   
                         }
                      ),
                     
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}