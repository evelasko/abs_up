import 'package:flutter/material.dart';

import 'app.dart';
import 'init.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //= initialize Hie
  await initializeHive();

  //= run AbsUp
  runApp(AbsUp());
}
