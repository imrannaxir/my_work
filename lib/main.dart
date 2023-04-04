import 'package:flutter/material.dart';
import 'route_names.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YA ALLAH',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: RouteNames.firstScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
