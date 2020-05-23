import 'package:abs_up/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'presentation/router/routes.dart';
import 'presentation/theme/theme.t.dart';

class AbsUp extends StatefulWidget {
  @override
  _AbsUpState createState() => _AbsUpState();
}

class _AbsUpState extends State<AbsUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AbsApp Data Setup',
      theme: appTheme,
      onGenerateRoute: FluroRouter.router.generator,
      initialRoute: HOME_LINK,
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
