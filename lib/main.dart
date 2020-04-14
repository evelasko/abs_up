import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'domain/repositories/i_application_facade.dart';
import 'domain/repositories/i_hive_facade.dart';
import 'presentation/router/routes.dart';
import 'presentation/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // = init Hive
  IHiveFacade.initHive();

  // = init Fluro Routes
  FluroRouter.setupRouter();

  // = init Application
  await IApplicationFacade().initApplication();
  // = run App
  runApp(AbsApp());
}

class AbsApp extends StatefulWidget {
  @override
  _AbsAppState createState() => _AbsAppState();
}

class _AbsAppState extends State<AbsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AbsApp Data Setup',
      theme: appTheme(),
      onGenerateRoute: FluroRouter.router.generator,
      initialRoute: DataValues.homeLink,
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
