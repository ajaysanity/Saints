
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:Saints/providers/globals.dart' as globals;

// Login Page
class IPhoneXXS11Pro2Widget extends StatelessWidget {
  final facebookLogin = FacebookLogin();

  _loginWithFB(context) async{
    
    final result = await facebookLogin.logIn(['email']);
    
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print('Login Success' );
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
          globals.userProfile = profile;
          globals.isLoggedIn = true;
          Navigator.pushNamed(context, "/home");         
        break;

      case FacebookLoginStatus.cancelledByUser:
    
        print('Login Cancelled' );
         globals.isLoggedIn = false;
        break;
      case FacebookLoginStatus.error:
    
        print('Login Error, Error: ${result.errorMessage}' );
         globals.isLoggedIn = false;
        break;
    }

  }

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
                          "Hi There,\nWelcome to Saints!",
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
                                "Log In",
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
                            checkLogin(context);
                         }
                      )
                    ),
                     Spacer(),
                    Align(
                      
                      alignment: Alignment.topCenter,
                      child: Text('or')
                     
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
                                "Use Facebook",
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
                            _loginWithFB(context);
                         }

                      )
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                width: 326,
                child: Text(
                  "Enter your username: \n mark",
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
// for authentication login
checkLogin(context) {
  if (!globals.isLoggedIn) {
    Navigator.pushNamed(context, "/home");    
  }
}