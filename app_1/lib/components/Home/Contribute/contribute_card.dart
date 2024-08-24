import 'package:app_1/shared/wrappers/ripple_wrapper.dart';
import 'package:flutter/material.dart';

class ContributeCard extends StatelessWidget {
  const ContributeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RippleWrapper(
      onPressed: () {},
      child: Container(
        height: 125,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.07)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contribute +',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Create a brief tour plan, or a well rounded journey and become someone’s tourbud!',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Quicksand'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
