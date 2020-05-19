import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'app.dart';
import 'domain/repositories/i_application_facade.dart';
import 'domain/repositories/i_hive_facade.dart';
import 'injection.dart';
import 'presentation/router/routes.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // = configure dependency injections
  configureInjection(Environment.prod);

  // = init Hive
  IHiveFacade.initHive();

  // = init Fluro Routes
  FluroRouter.setupRouter();

  // = init Application
  await IApplicationFacade().initApplication();
  // = run App
  runApp(AbsApp());
}
