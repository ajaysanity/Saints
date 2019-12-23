
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:Saints/providers/globals.dart' as globals;
import 'package:Saints/iphone_xxs11_pro3_widget/iphone_xxs11_pro3_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Saints/authentication/authentication.dart';


// Login Page
BuildContext contextSet;
class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   contextSet = context;
    return MaterialApp(
          home: Scaffold(
            body: LoginForm(),
          ),
        );
      }
}

class LoginForm extends StatefulWidget {
  
  
  LoginForm({this.auth, this.loginCallback});
  final BaseAuth auth;
  final VoidCallback loginCallback;
  
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<LoginForm> {
   String _email;
  String _password;
  String _errorMessage;
    bool _isLoginForm;
  bool _isLoading;

  final _formKey = GlobalKey<FormState>();
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => IPhoneXXS11Pro3Widget()));   
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
    loginWithEmail(context) {
          if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
      }

      // for authentication login
    void validateAndSubmit() async {
      setState(() {
        _errorMessage = "";
        _isLoading = true;
      });
        String userId = "";
        try {
         userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
          setState(() {
            _isLoading = false;
          });

          if (userId.length > 0 && userId != null && _isLoginForm) {
            widget.loginCallback();
          }
        } catch (e) {
          print('Error: $e');
          setState(() {
            _isLoading = false;
            _errorMessage = e.message;
            _formKey.currentState.reset();
          });
        }
    }
      
      bool _obscureText = true;
      TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 17.0);

      @override
      Widget build(BuildContext context) {
        final emailField = TextFormField(
            validator: (value) {
                if (value.isEmpty) {
                    return 'Please enter your email';
                    }
                return null;
              },
              obscureText: false,
              style: style,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70.withOpacity(0),
                  contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  icon: new Icon(
                  Icons.mail_outline,
                  color: Colors.black,
                    )),
            );
            final passwordField = TextFormField(
               validator: (value) {
                if (value.isEmpty) {
                    return 'Please enter your password';
                    }
                return null;
              },
              obscureText: _obscureText,
              style: style,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70.withOpacity(0),
                  contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  icon: new Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                    )),
            );
            final loginButon = Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {
                  loginWithEmail(context);
                },
                child: Text("Login",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0)),
              ),
            );
          
          final signUpText = Material(
              // elevation: 5.0,
              color: Color.fromARGB(0, 255, 255, 255),
              child: Row (
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,      
                  children: <Widget>[
                    Container (
                      child: Text(
                              "Don't have an account?  ",
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
                      child: new GestureDetector(
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
                      ), onTap: () {
                          goToSign(contextSet);
                      },
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



        return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [ Colors.white, Colors.blue[300],])),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 70.0),
                        Container(
                          height: 150.0,
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
                                fontSize: 25,
                                letterSpacing: 1.02,
                                fontFamily: "Roboto",
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 35.0),
                        Form ( 
                          key: _formKey,
                          child: Column( 
                            children: <Widget>[
                              emailField,
                              SizedBox(height: 25.0),
                              passwordField,
                            ],
                          ),
                        ),
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
                        SizedBox(
                          height: 20.0,
                        ),
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: MaterialButton(
                                onPressed: () => {},
                                child: Wrap (
                                    children: <Widget>[
                                      Container (
                                        width: MediaQuery.of(context).size.width,
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
            );
      }
  }

goToSign(context) {
  Navigator.pushNamed(context, "/signUp");     
}

//   static final _formKey = new GlobalKey<FormState>(); 
//   final facebookLogin = FacebookLogin();
//   _loginWithFB(context) async{
    
//     final result = await facebookLogin.logInWithReadPermissions(['email']);
    
//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:
//         print('Login Success' );
//         final token = result.accessToken.token;
//         final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
//         final profile = JSON.jsonDecode(graphResponse.body);
//         print(profile);
//           globals.userProfile = profile;
//           globals.isLoggedIn = true;
//           Navigator.pushNamed(context, "/home");         
//         break;

//       case FacebookLoginStatus.cancelledByUser:
    
//         print('Login Cancelled' );
//          globals.isLoggedIn = false;
//         break;
//       case FacebookLoginStatus.error:
    
//         print('Login Error, Error: ${result.errorMessage}' );
//          globals.isLoggedIn = false;
//         break;
//     }

//   }

//   
  
// }
