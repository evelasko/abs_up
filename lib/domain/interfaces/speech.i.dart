enum SpeechState { playing, stopped }

abstract class SpeechInterface {
  /// Speaks a given string
  Future<void> speak(String textToSpeak);

  /// Stops if currently speaking
  Future<void> stop();

  /// Speaks a given string and register a callback to run only once after speak completion
  Future<void> speakAndDo(String newVoiceText, void Function() effectWhenStop);
}
