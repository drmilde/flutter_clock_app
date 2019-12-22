import 'package:flutter/material.dart';

import 'clock.dart';
import 'clock_text.dart';


class AppClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height:280,
                child: new Clock(
                  circleColor: Colors.black,
                  showBellsAndLegs: false,
                  bellColor: Colors.green,
                  clockText: ClockText.arabic,
                  showHourHandleHeartShape: false,
                  currentTime: DateTime(2011,9,27,17,45,0,0,0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
