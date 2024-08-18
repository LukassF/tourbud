import 'package:app_1/shared/wrappers/ripple_wrapper.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final String label;
  final String image;
  final Function onPress;
  final bool? isLast;
  const CountryCard(
      {super.key,
      required this.label,
      required this.image,
      required this.onPress,
      this.isLast});

  @override
  Widget build(BuildContext context) {
    return RippleWrapper(
      onPressed: onPress,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: isLast == true ? 0 : 8),
        width: 90,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.0,
                        spreadRadius: -2,
                        offset: const Offset(0.0, 6.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  )),
              Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis),
              )
            ]),
      ),
    );
  }
}
