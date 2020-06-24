enum SpeechState { playing, stopped }

abstract class SpeechInterface {
  SpeechState speechState;
  void Function() startHandler;
  void Function() completionHandler;
  void Function() errorHandler;

  void Function() doOnceOnCompletion;
  void Function() doOnceOnStart;

  /// Speaks a given string
  Future<void> speak(String textToSpeak);

  /// Stops if currently speaking
  Future<void> stop();

  /// Speaks a given string and register a callback to run only once before speaking
  Future<void> doAndSpeak(
      String textToSpeak, void Function() effectBeforeStart);

  /// Speaks a given string and register a callback to run only once after speak completion
  Future<void> speakAndDo(String textToSpeak, void Function() effectWhenStop);
}
