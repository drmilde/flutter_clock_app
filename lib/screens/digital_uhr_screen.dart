import 'package:flutter/material.dart';
import 'package:flutter_clock_app/clock/clock.dart';
import 'package:flutter_clock_app/clock/clock_text.dart';
import 'package:flutter_clock_app/model/zeiten_generator.dart';
import 'package:flutter_clock_app/tts/speaker.dart';

class DigitalUhrScreen extends StatefulWidget {
  @override
  _DigitalUhrScreenState createState() => _DigitalUhrScreenState();
}

class _DigitalUhrScreenState extends State<DigitalUhrScreen> {
  int _stunde = 12;
  int _minute = 0;
  ZeitenGenerator zg = ZeitenGenerator();
  Speaker speaker = new Speaker();

  Clock clock = new Clock(
    circleColor: Colors.black,
    showBellsAndLegs: false,
    bellColor: Colors.green,
    clockText: ClockText.arabic,
    showHourHandleHeartShape: false,
    currentTime: DateTime(2011, 9, 27, 17, 45, 0, 0, 0),
  );

  @override
  void initState() {
    zg.generate();
    _stunde = zg.stunde;
    _minute = zg.minute;
    super.initState();
  }

  void _neueZeit() {
    setState(() {
      zg.generate();
      _stunde = zg.stunde;
      _minute = zg.minute;
      clock.currentTime = DateTime(2011, 9, 27, _stunde, _minute, 0, 0, 0);
      speaker.stop();
      speaker.speak(zg.getZeitString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sag die Zeit"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 280,
                child: clock,
              ),
            ),
            //_showDigitalTime(),
            _spacer(20),
            Text(
              zg.getZeitString(),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            _spacer(20),
            RaisedButton(
              child: Text("Nochmal"),
              onPressed: () {
                _neueZeit();
              },
            )
          ],
        ));
  }

  Row _showDigitalTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "${_toFormatedString(_stunde)}:${_toFormatedString(_minute)}",
          style: TextStyle(
            fontSize: 90,
          ),
        ),
      ],
    );
  }

  SizedBox _spacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  String _toFormatedString(int zahl) {
    if (zahl < 10) return ("0$zahl");
    return ("$zahl");
  }

  @override
  void dispose() {
    super.dispose();
    speaker.dispose();
  }
}
