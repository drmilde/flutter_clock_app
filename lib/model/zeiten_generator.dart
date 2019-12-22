import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clock_app/model/zeit_text.dart';

class ZeitenGenerator {
  int stunde;
  int minute;
  var random = Random.secure();
  ZeitText zt = ZeitText();

  ZeitenGenerator() {}

  void generate() {
    stunde = random.nextInt(12) + 1;
    minute = random.nextInt(12) * 5;
    //debugPrint("$stunde:$minute");
  }

  String getZeitString() {
    return zt.getZeitText(stunde, minute);
  }
}
