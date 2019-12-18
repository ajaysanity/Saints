
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
       
       final signUpText = Material(
          // elevation: 5.0,
          color: Color.fromARGB(0, 255, 255, 255),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,      
              children: <Widget>[
                Container (
                  child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Color(0xff01A0C7),
                            fontSize: 12,
                            letterSpacing: 1.02,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.center,
                  )
                ),
                Container (
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xff01A0C7),
                            fontSize: 14,
                            letterSpacing: 1.02,
                            fontFamily: "Roboto",
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                  )
                ),
              ]
          )
        );


  final Fbbutton = Material(
          // elevation: 5.0,
          color: Color.fromARGB(0, 255, 255, 255),
          child: SignInButton(
                Buttons.Facebook,
                mini: true,
                onPressed: () {
                  _loginWithFB(context);
                },
              )
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
                      height: 200.0,
                      width: 125,
                      child: new Image.asset('assets/images/saints-icon.png'),
                        
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
                    SizedBox(
                      height: 5.0,
                    ),
                    signUpText,
                      Expanded(
                        child: Align(
                           alignment: FractionalOffset.bottomCenter,
                           child: MaterialButton(
                            onPressed: () => {},
                             child: ListView (
                                 children: <Widget>[
                                   Container (
                                    child: Text('Login with Social Networks',
                                    textAlign: TextAlign.center, )
                                   ),
                                   Container (
                                     child: Row (
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                      Fbbutton
                                     ],)
                                   )
                                   
                                 ],
                             ) 
                          ),
                         ),
                      ),
                  ],
                ),
                
              ),
              
            ),
          ),
        );
  }
}
