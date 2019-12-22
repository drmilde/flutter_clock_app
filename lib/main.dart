import 'package:flutter/material.dart';
import 'package:flutter_clock_app/screens/digital_uhr_screen.dart';
import 'package:flutter_clock_app/tts/speak_screen.dart';


void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jakob Lernuhr",
      home: DigitalUhrScreen(),
    );
  }
}
