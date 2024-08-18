import 'package:app_1/layout.dart';
import 'package:app_1/pages/login_page.dart';
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
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              primary: const Color.fromARGB(255, 0, 179, 255),
              secondary: const Color.fromARGB(255, 255, 82, 131),
              secondaryContainer: const Color.fromARGB(255, 187, 187, 187),
              tertiary: const Color.fromARGB(255, 120, 118, 118),
              tertiaryContainer: const Color.fromARGB(255, 245, 245, 245)),
          useMaterial3: true,
          fontFamily: 'Poppins'),
      initialRoute: "/",
      routes: {
        "/": (context) => Layout(),
        "/login": (context) => LoginPage(setAccessToken: updateAccessToken)
      },
    );
  }
}
