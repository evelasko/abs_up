import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final String workoutId;

  const WorkoutDetailsPage({this.workoutId});

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutId),
      ),
      body: Center(
          child:
              Text('You are in the workout ${widget.workoutId} details page!')),
    );
  }
}
