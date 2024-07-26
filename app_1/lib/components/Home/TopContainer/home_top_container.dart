import 'package:flutter/material.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi, Łukasz',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
              ),
              Text(
                'Let your dreams guide you',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey[500]),
              )
            ],
          )),
          IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
