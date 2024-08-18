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
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Top countries',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 1,
                      color: Theme.of(context).colorScheme.secondaryContainer))
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                label: 'Switzerland',
                image: 'assets/images/switzerland.jpg',
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
