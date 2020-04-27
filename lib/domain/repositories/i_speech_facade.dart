import 'package:flutter_tts/flutter_tts.dart';

enum SpeechState { playing, stopped }

abstract class AISpeechFacade {
  Future<void> speak(String textToSpeak);
  Future<void> stop();
}

class ISpeechFacade implements AISpeechFacade {
  FlutterTts _flutterTts;
  dynamic languages;
  String language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  SpeechState speechState;
  void Function() startHandler;
  void Function() completionHandler;
  void Function() errorHandler;

  ISpeechFacade() {
    _flutterTts = FlutterTts();

    _getLanguages();

    _flutterTts.setStartHandler(() {
      print("playing");
      speechState = SpeechState.playing;
      if (startHandler != null) startHandler();
    });

    _flutterTts.setCompletionHandler(() {
      print("complete");
      speechState = SpeechState.stopped;
      if (completionHandler != null) completionHandler();
    });

    _flutterTts.setErrorHandler((msg) {
      print("error: $msg");
      speechState = SpeechState.stopped;
      if (errorHandler != null) errorHandler();
    });
  }

  Future<void> _getLanguages() async {
    final dynamic _languages = await _flutterTts.getLanguages;
    if (_languages != null) languages = _languages;
  }

  @override
  Future<void> speak(String newVoiceText) async {
    await _flutterTts.setVolume(volume);
    await _flutterTts.setSpeechRate(rate);
    await _flutterTts.setPitch(pitch);

    if (newVoiceText != null) {
      if (newVoiceText.isNotEmpty) {
        final result = await _flutterTts.speak(newVoiceText);
        if (result == 1) speechState = SpeechState.playing;
      }
    }
  }

  @override
  Future<void> stop() async {
    final result = await _flutterTts.stop();
    if (result == 1) speechState = SpeechState.stopped;
  }
}
