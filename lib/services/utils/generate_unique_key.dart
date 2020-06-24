import 'package:uuid/uuid.dart';

/// Generates a key tested as unique for the given list of strings
String generateUniqueKey(List<String> checkList) {
  final Uuid uuid = Uuid();
  String uniqueKey = uuid.v4();
  if (checkList == null) return uniqueKey;
  while (checkList.contains(uniqueKey)) {
    uniqueKey = uuid.v4();
  }
  return uniqueKey;
}
