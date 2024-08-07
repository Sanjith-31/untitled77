import 'package:flutter/material.dart';
import 'package:untitled77/Account_Creation_Page.dart';
import 'package:untitled77/Home.dart';
import 'package:untitled77/Login.dart';
import 'package:untitled77/searching_page.dart';
import 'pages/Google.dart';
import 'pages/Youtube.dart';
import 'pages/Facebook.dart';
import 'pages/Yahoo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Social App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountCreationPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchingPage(),
        '/page1': (context) => Google(),
        '/page2': (context) => Youtube(),
        '/page3': (context) => Facebook(),
        '/page4': (context) => Yahoo(),
      },
    );
  }
}
