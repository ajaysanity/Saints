
import 'package:flutter/material.dart';
import 'package:Saints/iphone_xxs11_pro1_widget/iphone_xxs11_pro1_widget.dart';
import 'package:Saints/iphone_xxs11_pro2_widget/iphone_xxs11_pro2_widget.dart';
import 'package:Saints/iphone_xxs11_pro3_widget/iphone_xxs11_pro3_widget.dart';
import 'package:Saints/iphone_xxs11_pro4_widget/iphone_xxs11_pro4_widget.dart';
import 'package:Saints/profile_page/profile.dart';

void main() => runApp(App());

const String landingRoute = '/';
const String homeRoute = '/home';
const String loginRoute = '/login';
const String testRoute = '/test';
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
        return MaterialPageRoute(builder: (_) => IPhoneXXS11Pro2Widget());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => IPhoneXXS11Pro3Widget());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => Profile());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}