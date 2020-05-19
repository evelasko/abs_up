import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'domain/repositories/data_values.dart';
import 'presentation/router/routes.dart';
import 'presentation/theme/theme.dart';

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
