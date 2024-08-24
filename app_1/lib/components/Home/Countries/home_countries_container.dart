import 'package:app_1/shared/cards/country_card.dart';
import 'package:flutter/material.dart';

class HomeCountriesContainer extends StatefulWidget {
  const HomeCountriesContainer({super.key});

  @override
  State<HomeCountriesContainer> createState() => _HomeCountriesContainerState();
}

class _HomeCountriesContainerState extends State<HomeCountriesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16.0),
                child: const Text(
                  'Top countries',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 1,
                      color: Theme.of(context).colorScheme.secondaryContainer))
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              CountryCard(
                  label: 'Italy',
                  image: 'assets/images/italy.png',
                  onPress: () {}),
              CountryCard(
                  label: 'France',
                  image: 'assets/images/france.png',
                  onPress: () {}),
              CountryCard(
                  label: 'Spain',
                  image: 'assets/images/spain.webp',
                  onPress: () {}),
              CountryCard(
                label: 'Mexico',
                image: 'assets/images/mexico.png',
                onPress: () {},
                isLast: true,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
