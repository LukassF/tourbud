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
  final num? rating;
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
    bool isTrip = type == TRIP_CARD_TYPE.TRIP;

    return RippleWrapper(
      onPressed: () {},
      child: Container(
        width: 300,
        margin: EdgeInsets.only(right: isLast == true ? 0 : 16),
        child: Stack(children: [
          Positioned(
              child: Column(
            children: [
              Container(
                  height: 180,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8.0,
                        spreadRadius: -2,
                        offset: const Offset(0.0, 6.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(
                          image,
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.2),
                          BlendMode.srcOver,
                        )),
                  )),
              Container(
                height: 65,
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Quicksand',
                                  fontSize: 18),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 4),
                                    child: SvgPicture.asset(
                                        'assets/icons/location.svg',
                                        width: 12,
                                        height: 12,
                                        colorFilter: ColorFilter.mode(
                                            Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            BlendMode.srcIn)),
                                  ),
                                  Text(
                                    location,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            isTrip
                                ? Row(
                                    children: [
                                      Text(
                                        GeneralUtils.formatTripDuration(
                                            days ?? 0),
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.w100,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: SvgPicture.asset(
                                            'assets/icons/clock.svg',
                                            width: 11,
                                            height: 11,
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                                BlendMode.srcIn)),
                                      ),
                                    ],
                                  )
                                : Expanded(
                                    child: Wrap(
                                        spacing: 5,
                                        children: List.generate(5, (index) {
                                          final isFilled =
                                              (index + 1) <= (rating ?? 0);
                                          return SvgPicture.asset(
                                            'assets/icons/star_filled.svg',
                                            colorFilter: ColorFilter.mode(
                                                isFilled
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                        .withOpacity(0.2),
                                                BlendMode.srcIn),
                                          );
                                        })),
                                  ),
                            isTrip
                                ? Row(
                                    children: [
                                      Text(
                                        GeneralUtils.formatNumberOfPeople(
                                            people ?? 0),
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.w100,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: SvgPicture.asset(
                                            'assets/icons/profile.svg',
                                            width: 11,
                                            height: 11,
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                                BlendMode.srcIn)),
                                      ),
                                    ],
                                  )
                                : Expanded(
                                    child: Text(
                                      '$rating (${GeneralUtils.formatAmount(mentions ?? 0)} mentions)',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w100,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ],
          )),
          isTrip
              ? Positioned(
                  bottom: 55,
                  right: 10,
                  child: Container(
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8.0,
                          spreadRadius: -2,
                          offset: const Offset(0.0, 5.0),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '$price\$',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ]),
      ),
    );
  }
}
