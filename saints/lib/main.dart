
import 'package:Saints/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:Saints/iphone_xxs11_pro1_widget/iphone_xxs11_pro1_widget.dart';
import 'package:Saints/iphone_xxs11_pro2_widget/iphone_xxs11_pro2_widget.dart';
import 'package:Saints/iphone_xxs11_pro3_widget/iphone_xxs11_pro3_widget.dart';
import 'package:Saints/profile_page/profile.dart';
import 'package:Saints/signup/signup.dart';
import 'package:Saints/signup/signup_part2.dart';

void main() => runApp(App());

const String landingRoute = '/';
const String homeRoute = '/home';
const String loginRoute = '/login';
const String profileRoute = '/profile';
const String calendarRoute = '/calendar';
const String signUpRoute = '/signUp';
const String signUpContinueRoute = '/signUpPart2';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: landingRoute,
    );
  }
}

class Router {
static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingRoute:
        return MaterialPageRoute(builder: (_) => IPhoneXXS11Pro1Widget());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => Login());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => IPhoneXXS11Pro3Widget());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => Profile());
      case calendarRoute:
        return MaterialPageRoute(builder: (_) => CalendarWidget());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUp());
      case signUpContinueRoute:
        return MaterialPageRoute(builder: (_) => ContinueSignUp());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}