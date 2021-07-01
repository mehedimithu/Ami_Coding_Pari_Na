import 'package:ami_coding_pari_na/screens/home/home_page.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Ami Coding Pari Na',
      theme: new ThemeData(primarySwatch: Colors.lightBlue),
      routes: routes,
    );
  }
}
