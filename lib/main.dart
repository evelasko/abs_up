import 'package:data_setup/domain/repositories/i_application_facade.dart';
import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:data_setup/domain/state/application_state.dart';
import 'package:data_setup/presentation/pages/home.page.dart';
import 'package:data_setup/presentation/router/routes.dart';
import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

import 'domain/models/exercise.dart';
import 'domain/repositories/data_repository.dart';
import 'domain/state/exercise_store.dart';
import 'presentation/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // = init Hive
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  IHiveFacade.initHiveAndAdapters(
      appDocumentDirectory.path, [ExerciseAdapter()]);
  // await Hive.openBox<Exercise>('exercises');
  // await Hive.openBox('user_settings');
  await IHiveFacade.openHiveBoxes();

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
      initialRoute: FluroRouter.homeLink,
      //   home: FutureBuilder(
      //       future: IApplicationFacade().initApplication(),
      //       builder: (BuildContext context, AsyncSnapshot snapshot) {
      //         if (snapshot.connectionState == ConnectionState.done) {
      //           if (snapshot.hasError)
      //             return Text(snapshot.error.toString());
      //           else if (snapshot.hasData)
      //             return Provider(
      //               create: (_) => ApplicationStore(ExerciseDataRepository()),
      //               child: HomePage(),
      //             );
      //           else
      //             return Scaffold(body: CircularProgressIndicator());
      //         } else {
      //           return Scaffold(body: CircularProgressIndicator());
      //         }
      //       }),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
