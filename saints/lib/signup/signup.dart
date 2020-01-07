
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:Saints/providers/globals.dart' as globals;

// Login Page
class SignUp extends StatelessWidget {
  
  static final _formKey = new GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
          home: Scaffold(
            body: MyCustomForm(),
          ),
        );
      }
    }

class MyCustomForm extends StatefulWidget {
<<<<<<< HEAD
=======
  
  
  MyCustomForm({this.auth, this.loginCallback});
  final BaseAuth auth;
  final VoidCallback loginCallback;

>>>>>>> parent of 7449dd5... Sign Up Added method and plugins - not yet complete
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widgetr
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

<<<<<<< HEAD
=======
   void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
      String userId = "";
      try {
        userId = await widget.auth.signUp(_email, _password, _name);
        //widget.auth.sendEmailVerification();
        //_showVerifyEmailSentDialog();
        print('Signed up user: $userId');
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
>>>>>>> parent of 7449dd5... Sign Up Added method and plugins - not yet complete
  @override
  Widget build(BuildContext context) {
    
  final name = TextEditingController();
  final email = TextEditingController();
  String password = '';
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 17.0, color: Colors.black);
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
            // errorStyle: TextStyle(color: Colors.red[100]),
            filled: true,
            fillColor: Colors.white70.withOpacity(0),
              contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
        );

    final nameField = TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                  return 'Please enter your Name';
                }
              return null;
            },
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white70.withOpacity(0),
              contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
              hintText: "Name",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),),
        );

    final passwordField = TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                  return 'Please enter your Password';
              } else {
                password = value;
              }
              return null;
            },
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white70.withOpacity(0),
              contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),),
        );

     final confirmPasswordField = TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                  return 'Please confirm your Password';
                } else if (value != password) {
                  return 'Password is not the same';
                }
              return null;
            },
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white70.withOpacity(0),
              contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
              hintText: "Confirm Password",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),),
        );
    
        final signUpButton = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
               if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
            },
            child: Text("Submit",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        );
       
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ Colors.white, Colors.blue[300],])),
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
                    Form (
                         key: _formKey,
                          child: Column(
                            children: <Widget>[
                              emailField,
                               SizedBox(height: 15.0), 
                               nameField,
                                SizedBox(
                                  height: 15.0,
                                ),
                                passwordField,
                                SizedBox(
                                  height: 15.0,
                                ),
                                confirmPasswordField,
                                SizedBox(
                                  height: 35.0,
                                ),
                                signUpButton
                            ],
                          ),
                    ),
                   
                     
                  ],
                ),
                
              ),
              
            ),
          );
  }
}
   
