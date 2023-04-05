import 'dart:js';

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
        return ScaleFadeTransition(
          page: SecondScreen(
            data: settings.arguments as Map,
          ),
        );
      // return MaterialPageRoute(builder: (BuildContext context) {
      //   return SecondScreen(
      //     data: settings.arguments as Map,
      //   );
      // });
      case RouteNames.thirdScreen:
        return ScaleFadeTransition(
          page: ThirdScreen(
            data: settings.arguments as Map,
          ),
        );
      // return MaterialPageRoute(builder: (BuildContext context) {
      //   return ThirdScreen(
      //     data: settings.arguments as Map,
      //   );
      // });
      default:
        return ScaleFadeTransition(
          page: ErrorScreen(
            data: settings.arguments as Map,
          ),
        );
      // return MaterialPageRoute(builder: (BuildContext context) {
      //   return ErrorScreen(data: settings.arguments as Map);
      // });
    }
  }
}

class ScaleFadeTransition extends PageRouteBuilder {
  ScaleFadeTransition({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (context, animation, reverseAnimation) => page,
          transitionDuration: const Duration(seconds: 2),
          reverseTransitionDuration: const Duration(seconds: 2),
          settings: settings,
          transitionsBuilder: (
            context,
            animation,
            reverseAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale:
                  CurvedAnimation(parent: animation, curve: Curves.bounceInOut),
              child: child,
            ),
          ),
        );
  final Widget page;
}
