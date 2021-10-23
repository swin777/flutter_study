import 'package:flutter/material.dart';
import 'package:nested_nv/pages/home_page.dart';
import 'package:nested_nv/pages/profile_page.dart';
import 'package:nested_nv/pages/settings_page.dart';
import 'package:nested_nv/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Navigator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/signup': (BuildContext context) => SignupPage(),
        '/settings': (BuildContext _) => SettingsPage(),
        '/profile': (BuildContext _) => ProfilePage(),
      },
    );
  }
}
