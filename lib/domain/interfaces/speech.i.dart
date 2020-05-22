enum SpeechState { playing, stopped }

abstract class SpeechInterface {
  /// Speaks a given string
  Future<void> speak(String textToSpeak);

  /// Stops if currently speaking
  Future<void> stop();
}
