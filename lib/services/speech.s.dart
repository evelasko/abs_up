import 'package:abs_up/domain/interfaces/speech.i.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@RegisterAs(SpeechInterface)
class SpeechService implements SpeechInterface {
  final FlutterTts flutterTts;
  dynamic languages;
  String language;
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 0.5;

  @override
  SpeechState speechState;
  @override
  void Function() startHandler;
  @override
  void Function() completionHandler;
  @override
  void Function() errorHandler;
  @override
  void Function() doOnceOnCompletion;
  @override
  void Function() doOnceOnStart;

  SpeechService(this.flutterTts) {
    _getLanguages();

    flutterTts.setStartHandler(() {
      speechState = SpeechState.playing;
      if (startHandler != null) startHandler();
      if (doOnceOnStart != null) {
        doOnceOnStart();
        doOnceOnStart = null;
      }
    });

    flutterTts.setCompletionHandler(() {
      speechState = SpeechState.stopped;
      if (completionHandler != null) completionHandler();
      if (doOnceOnCompletion != null) {
        doOnceOnCompletion();
        doOnceOnCompletion = null;
      }
    });

    flutterTts.setErrorHandler((msg) {
      speechState = SpeechState.stopped;
      if (errorHandler != null) errorHandler();
    });
  }

  Future<void> _getLanguages() async {
    final dynamic _languages = await flutterTts.getLanguages;
    if (_languages != null) languages = _languages;
  }

  @override
  Future<void> speak(String newVoiceText) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (newVoiceText != null) {
      if (newVoiceText.isNotEmpty) {
        final result = await flutterTts.speak(newVoiceText);
        if (result == 1) speechState = SpeechState.playing;
      }
    }
  }

  @override
  Future<void> doAndSpeak(
    String textToSpeak,
    void Function() effectBeforeStart,
  ) async {
    doOnceOnStart = effectBeforeStart;
    await speak(textToSpeak);
  }

  @override
  Future<void> speakAndDo(
    String textToSpeak,
    void Function() effectWhenStop,
  ) async {
    doOnceOnCompletion = effectWhenStop;
    await speak(textToSpeak);
  }

  @override
  Future<void> stop() async {
    final result = await flutterTts.stop();
    if (result == 1) speechState = SpeechState.stopped;
  }

  @override
  Future<void> panic() async {
    doOnceOnCompletion = null;
    doOnceOnStart = null;
    final result = await flutterTts.stop();
    if (result == 1) speechState = SpeechState.stopped;
  }
}
