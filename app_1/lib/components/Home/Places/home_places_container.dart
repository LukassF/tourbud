import 'package:app_1/classes/interfaces.dart';
import 'package:app_1/shared/cards/trip_card.dart';
import 'package:flutter/material.dart';

class HomePlacesContainer extends StatefulWidget {
  const HomePlacesContainer({super.key});

  @override
  State<HomePlacesContainer> createState() => _HomePlacesContainerState();
}

class _HomePlacesContainerState extends State<HomePlacesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
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
                  'Top places',
                  style: TextStyle(fontSize: 18),
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
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: const [
              TripCard(
                type: TRIP_CARD_TYPE.PLACE,
                name: 'Eifell Tower',
                location: 'Paris, France',
                image: 'assets/images/eifel_tower.jpg',
                mentions: 122000,
                rating: 2,
              ),
              TripCard(
                type: TRIP_CARD_TYPE.PLACE,
                name: 'Machu Picchu',
                location: 'Peru',
                image: 'assets/images/machu_picchu.jpg',
                mentions: 212100,
                rating: 4,
                isLast: true,
              )
            ],
          ),
        )
      ]),
    );
  }
}
