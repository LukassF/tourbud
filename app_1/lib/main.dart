import 'package:app_1/layout.dart';
import 'package:app_1/pages/HomePage.dart';
import 'package:app_1/pages/LoginPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String accessToken = "";

  void updateAccessToken(String token) {
    setState(() {
      accessToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Ubuntu'),
      initialRoute: "/",
      routes: {
        "/": (context) => Layout(),
        "/login": (context) => LoginPage(setAccessToken: updateAccessToken)
      },
    );
  }
}
