import 'package:app_1/classes/interfaces.dart';
import 'package:app_1/shared/cards/trip_card.dart';
import 'package:app_1/shared/wrappers/ripple_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePlacesContainer extends StatefulWidget {
  const HomePlacesContainer({super.key});

  @override
  State<HomePlacesContainer> createState() => _HomePlacesContainerState();
}

class _HomePlacesContainerState extends State<HomePlacesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 348,
      padding: const EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          // margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16.0),
                child: const Text(
                  'Top places',
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
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
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
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn),
                        ),
                      ),
                      Text(
                        'Filter results',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
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
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn),
                        ),
                      ),
                      Text(
                        'Sort results',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 13),
                      )
                    ]),
                  )
                ]),
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
                rating: 2.3,
              ),
              TripCard(
                type: TRIP_CARD_TYPE.PLACE,
                name: 'Machu Picchu',
                location: 'Peru',
                image: 'assets/images/machu_picchu.jpg',
                mentions: 212100,
                rating: 4.1,
                isLast: true,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
