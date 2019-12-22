import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped }

class Speaker {
  FlutterTts flutterTts;
  String language = "de";
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;

  TtsState ttsState = TtsState.stopped;
  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

  Speaker() {
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();
    flutterTts.setLanguage(language);

    flutterTts.setStartHandler(() {
      print("playing");
      ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
      print("Complete");
      ttsState = TtsState.stopped;
    });

    flutterTts.setErrorHandler((msg) {
      print("error");
      ttsState = TtsState.stopped;
    });
  }

  Future speak(String text) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (text != null) {
      if (text.isNotEmpty) {
        var result = await flutterTts.speak(text);
        if (result == 1) {
          return ttsState = TtsState.playing;
        }
        ;
      }
    }
  }

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) {
      ttsState = TtsState.stopped;
    }
  }

  void dispose() {
    flutterTts.stop();
  }
}
