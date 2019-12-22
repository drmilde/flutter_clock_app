import 'package:flutter/material.dart';
import 'package:flutter_clock_app/model/zeiten_generator.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  ZeitenGenerator zg = ZeitenGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jakobs Lernuhr")),
      body: Container(
        child: RaisedButton(
          child: Text("generate"),
          onPressed: () {
            zg.generate();
          },
        ),
      ),
    );
  }
}
