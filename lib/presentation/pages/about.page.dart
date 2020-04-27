import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Settings'.toUpperCase(),
              style: const TextStyle(letterSpacing: 1)),
        ),
        body: Column(),
      );
}
