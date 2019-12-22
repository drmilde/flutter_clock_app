import 'package:flutter/cupertino.dart';

class ZeitText {
  Map<int, String> abbildung = Map<int, String>();
  Map<int, String> stunden = Map<int, String>();

  ZeitText() {
    initZeitText();
  }

  void initZeitText() {
    abbildung[0] = "";
    abbildung[5] = "fünf nach";
    abbildung[10] = "zehn nach";
    abbildung[15] = "viertel nach";
    abbildung[20] = "zwanzig nach";
    abbildung[25] = "fünf vor halb";
    abbildung[30] = "halb";
    abbildung[35] = "fünf nach halb";
    abbildung[40] = "zwanzig vor";
    abbildung[45] = "viertel vor";
    abbildung[50] = "zehn vor";
    abbildung[55] = "fünf vor";

    stunden[0] = "zwölf";
    stunden[1] = "ein";
    stunden[2] = "zwei";
    stunden[3] = "drei";
    stunden[4] = "vier";
    stunden[5] = "fünf";
    stunden[6] = "sechs";
    stunden[7] = "sieben";
    stunden[8] = "acht";
    stunden[9] = "neun";
    stunden[10] = "zehn";
    stunden[11] = "elf";
    stunden[12] = "zwölf";
  }

  String getZeitText(int stunde, int minute) {
    if (minute >= 25) {
      stunde = (stunde+1)%12;
    }

    String uhr = "";
    String stunde_s = "";

    if (minute == 0) {
      uhr = " Uhr";
    } else {
      if (stunde == 1) {
        stunde_s = "s";
      }
    }
    return ("Es ist ${abbildung[minute]} ${stunden[stunde]}${stunde_s}${uhr}.");
  }
}
