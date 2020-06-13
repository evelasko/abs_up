import 'package:abs_up/domain/interfaces/speech.i.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechService implements SpeechInterface {
  FlutterTts _flutterTts;
  dynamic languages;
  String language;
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 0.5;
  SpeechState speechState;
  void Function() startHandler;
  void Function() completionHandler;
  void Function() errorHandler;

  void Function() _doOnceOnCompletion;
  void Function() _doOnceOnStart;

  SpeechService() {
    _flutterTts = FlutterTts();

    _getLanguages();

    _flutterTts.setStartHandler(() {
      speechState = SpeechState.playing;
      if (startHandler != null) startHandler();
      if (_doOnceOnStart != null) {
        _doOnceOnStart();
        _doOnceOnStart = null;
      }
    });

    _flutterTts.setCompletionHandler(() {
      speechState = SpeechState.stopped;
      if (completionHandler != null) completionHandler();
      if (_doOnceOnCompletion != null) {
        _doOnceOnCompletion();
        _doOnceOnCompletion = null;
      }
    });

    _flutterTts.setErrorHandler((msg) {
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
  Future<void> speakAndDo(
      String newVoiceText, void Function() effectWhenStop) async {
    _doOnceOnCompletion = effectWhenStop;
    await speak(newVoiceText);
  }

  @override
  Future<void> stop() async {
    final result = await _flutterTts.stop();
    if (result == 1) speechState = SpeechState.stopped;
  }
}
