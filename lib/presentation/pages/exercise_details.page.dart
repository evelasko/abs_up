import 'package:data_setup/domain/models/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetailsPage(this.exercise);

  @override
  _ExerciseDetailsPageState createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
      ),
      body: Center(
          child: Text(
              'You are in the workout ${widget.exercise.name} details page!')),
    );
  }
}
