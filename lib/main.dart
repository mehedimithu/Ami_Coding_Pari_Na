import 'package:flutter/material.dart';

import 'screens/login/login_page.dart';

void main() => runApp(new MyApp());

final routes = {
  // '/signup': (BuildContext context) => new SignupPage(),
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ami Coding Pari Na',
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      routes: routes,
    );
  }
}
