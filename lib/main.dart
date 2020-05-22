import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'app.dart';
import 'injection.dart';
import 'presentation/router/routes.dart';
import 'services/app.s.dart';
import 'services/p_data.s.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // = configure dependency injections
  configureInjection(Environment.prod);

  // = init Hive
  await PDataService.initHive();

  // = init Fluro Routes
  FluroRouter.setupRouter();

  // = init Application
  await ApplicationServices().initApplication();
  // = run App
  runApp(AbsUp());
}
