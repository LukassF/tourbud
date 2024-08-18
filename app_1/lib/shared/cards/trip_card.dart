import 'package:app_1/classes/interfaces.dart';
import 'package:app_1/classes/utils.dart';
import 'package:app_1/shared/wrappers/ripple_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TripCard extends StatelessWidget {
  final bool? isLast;
  final TRIP_CARD_TYPE type;
  final String name;
  final String location;
  final String image;
  final num? price;
  final int? days;
  final int? people;
  final int? rating;
  final num? mentions;
  const TripCard(
      {super.key,
      this.isLast,
      required this.type,
      required this.name,
      required this.location,
      required this.image,
      this.price,
      this.days,
      this.people,
      this.rating,
      this.mentions});

  @override
  Widget build(BuildContext context) {
    return RippleWrapper(
      onPressed: () {},
      child: Container(
        height: type == TRIP_CARD_TYPE.TRIP ? 190 : 150,
        width: 250,
        margin: EdgeInsets.only(right: isLast == true ? 0 : 8),
        child: Stack(children: [
          type == TRIP_CARD_TYPE.TRIP
              ? Positioned(
                  bottom: 0,
                  height: 40,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: SvgPicture.asset('assets/icons/clock.svg',
                                  width: 12,
                                  height: 12,
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.tertiary,
                                      BlendMode.srcIn)),
                            ),
                            Text(
                              GeneralUtils.formatTripDuration(days ?? 0),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: SvgPicture.asset(
                                  'assets/icons/profile.svg',
                                  width: 12,
                                  height: 13,
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.tertiary,
                                      BlendMode.srcIn)),
                            ),
                            Text(
                              GeneralUtils.formatNumberOfPeople(people ?? 0),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
              : SizedBox.shrink(),
          Positioned(
              child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.0,
                        spreadRadius: -2,
                        offset: const Offset(0.0, 6.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ))),
          Positioned(
              child: Container(
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.6)
                        ],
                        stops: [0.25, 0.75],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 4),
                                  child: SvgPicture.asset(
                                      'assets/icons/location.svg',
                                      width: 14,
                                      height: 14,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.white, BlendMode.srcIn)),
                                ),
                                Expanded(
                                  child: Text(
                                    location,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Text('$price\$',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 14)),
                          )
                        ],
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
