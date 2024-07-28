import 'dart:convert';

import 'package:app_1/classes/constants.dart';
import 'package:app_1/components/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.setAccessToken});

  final Function setAccessToken;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void logIn(String login, String password) async {
    try {
      if (password.isNotEmpty && login.isNotEmpty) {
        Response res = await post(
            Uri.parse('${Constants.BACKEND_BASE_URL}auth/login'),
            body: {"login": login, "password": password});
        print(res);

        var data = jsonDecode(res.body);
        final String accessToken = data['content']['access_token'];
        // final String refreshToken = data['content']['refresh_token'];

        if (accessToken.isNotEmpty) {
          widget.setAccessToken(accessToken);
          if (context.mounted) Navigator.of(context).pushNamed("/");
        }
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/736x/d0/96/7f/d0967ffd8eefeadb839541f60e53a804.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    "Excursio duo",
                    style: TextStyle(
                        height: 0.9,
                        fontSize: 55.0,
                        fontFamily: 'Dancing',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Take off with someone else!",
                    style: TextStyle(color: Colors.white54, fontSize: 18.0),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              barrierColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0))),
                              context: context,
                              builder: (ctx) => Login(
                                    logIn: logIn,
                                  ));
                        },
                        child: const Text('Log in',
                            style: TextStyle(
                                color: Color(0xFF195451), fontSize: 18)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FloatingActionButton(
                        backgroundColor: const Color(0xFF195451),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {},
                        child: const Text('Sign up',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
