import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'presentation/pages/main_page.dart';
import 'data/models/exercise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // = init Hive
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ExerciseAdapter());

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
      home: FutureBuilder(
          future: Hive.openBox('exercises'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return MainPage();
            } else {
              return Scaffold(body: CircularProgressIndicator());
            }
          }),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
