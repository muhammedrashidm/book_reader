// ignore_for_file: file_names

import 'package:flutter_tts/flutter_tts.dart';

class TextPlayer {
  FlutterTts flutterTts = FlutterTts();
  Future<bool> speak(String text) async {
    var result = await flutterTts.speak(text);
    return result == 1 ? true : false;
  }

  Future<bool> stop() async {
    var result = await flutterTts.stop();
    return result == 1 ? false : true;
  }

  void getLanguages() async {
    List<dynamic> languages = await flutterTts.getLanguages;
  }

  void setLanguage() async {
    await flutterTts.setLanguage("en-US");
  }

  Future<double> setSpeechRate(double rate) async {
    await flutterTts.setSpeechRate(rate + 0.1);
    return rate + 0.1;
  }

  void setVolume() async {
    await flutterTts.setVolume(1.0);
  }

  void setPitch() async {
    await flutterTts.setPitch(1.0);
  }

  void isLanguageAvailable() async {
    await flutterTts.isLanguageAvailable("en-US");
  }

  void setVoice() async {
    await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
  }
}
