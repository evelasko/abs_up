import 'package:data_setup/presentation/router/routes.dart';
import 'package:flutter/material.dart';

// Splash page...
class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Splash')),
        body: ListView(
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, FluroRouter.homeLink);
                },
                child: Text('go Home')),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, FluroRouter.exerciseListLink);
                },
                child: Text('Exercise List'))
          ],
        ));
  }
}
