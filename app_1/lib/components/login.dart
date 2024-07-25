import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.logIn});

  final Function logIn;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _login = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          16.0, 16.0, 16.0, MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 1.0)),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          print('hi');
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF13726E),
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0,
                            decorationColor: Color(0xFF13726E),
                          ),
                        ))
                  ],
                )
              ]),
          TextField(
            onChanged: (value) => setState(() {
              _login = value;
            }),
            decoration: const InputDecoration(
                labelText: 'Username', hintText: 'Enter Your Username'),
          ),
          TextField(
            onChanged: (value) => setState(() {
              _password = value;
            }),
            obscureText: true,
            decoration: const InputDecoration(
                labelText: 'Password', hintText: 'Enter Your Password'),
          ),
          const SizedBox(
            height: 25,
          ),
          FloatingActionButton(
            backgroundColor: const Color(0xFF195451),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            onPressed: () {
              widget.logIn(_login, _password);
            },
            child: const Text('Log in',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
