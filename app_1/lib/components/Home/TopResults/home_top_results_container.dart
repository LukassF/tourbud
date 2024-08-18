import 'package:app_1/classes/interfaces.dart';
import 'package:app_1/shared/wrappers/ripple_wrapper.dart';
import 'package:app_1/shared/cards/trip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopResultsContainer extends StatefulWidget {
  const HomeTopResultsContainer({super.key});

  @override
  State<HomeTopResultsContainer> createState() =>
      _HomeTopResultsContainerState();
}

class _HomeTopResultsContainerState extends State<HomeTopResultsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: const <Widget>[
                TripCard(
                  type: TRIP_CARD_TYPE.TRIP,
                  image: 'assets/images/burano.webp',
                  name: 'Murano & Burano',
                  location: 'Venice, Italy',
                  price: 732.99,
                  days: 6,
                  people: 3,
                ),
                TripCard(
                  type: TRIP_CARD_TYPE.TRIP,
                  image: 'assets/images/northern_lights.jpg',
                  name: 'Northern Adventure',
                  location: 'Oslo, Norway',
                  price: 1019.99,
                  days: 14,
                  people: 3,
                ),
                TripCard(
                  type: TRIP_CARD_TYPE.TRIP,
                  image: 'assets/images/beach.jpg',
                  name: 'Mallorca',
                  location: 'Galturna, Mallorca',
                  price: 199.22,
                  days: 3,
                  people: 6,
                  isLast: true,
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RippleWrapper(
                      customOpacity: 0.5,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40.0))),
                            context: context,
                            builder: (ctx) => Container(
                                  height: 350,
                                ));
                      },
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: SvgPicture.asset(
                            'assets/icons/filter.svg',
                            width: 13,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.secondary,
                                BlendMode.srcIn),
                          ),
                        ),
                        Text(
                          'Filter results',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 13),
                        )
                      ]),
                    ),
                    RippleWrapper(
                      customOpacity: 0.5,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {},
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: SvgPicture.asset(
                            'assets/icons/sort.svg',
                            width: 18,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.secondary,
                                BlendMode.srcIn),
                          ),
                        ),
                        Text(
                          'Sort results',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 13),
                        )
                      ]),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
