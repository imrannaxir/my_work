import 'package:flutter/material.dart';
import 'error_screen.dart';
import 'first_screen.dart';
import 'route_names.dart';
import 'second_screen.dart';
import 'third_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // RouteSettings have two things name and arguments
    switch (settings.name) {
      case RouteNames.firstScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const FirstScreen();
        });
      case RouteNames.secondScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return SecondScreen(
            data: settings.arguments as Map,
          );
        });
      case RouteNames.thirdScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return ThirdScreen(
            data: settings.arguments as Map,
          );
        });
      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return ErrorScreen(data: settings.arguments as Map);
        });
    }
  }
}
