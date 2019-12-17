
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:Saints/providers/globals.dart' as globals;

// Login Page
class IPhoneXXS11Pro2Widget extends StatelessWidget {
  final facebookLogin = FacebookLogin();

  _loginWithFB(context) async{
    
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    
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
  
  // for authentication login
checkLogin(context) {
  Navigator.pushNamed(context, "/home");   
}

      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final passwordField = TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {},
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );
       
       final UseFacebook = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {},
            child: Text("Sign up",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

    return Scaffold(
          body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 85,
                      margin: EdgeInsets.all(30),
                      child: new CircleAvatar(
                          backgroundImage: new AssetImage('assets/images/mask-group-2.png'),
                        ) 
                    ),
                    SizedBox (
                      child: Container(
                        width: 326,
                        child: Text(
                          "Hi There,\nWelcome to Saints!",
                          style: TextStyle(
                            color: Color(0xff01A0C7),
                            fontSize: 20,
                            letterSpacing: 1.02,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    Container (
                      child: Text('or')
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    UseFacebook
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
