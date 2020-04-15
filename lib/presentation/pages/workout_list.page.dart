import 'package:data_setup/presentation/widgets/shared/savedworkout_items.dart';
import 'package:flutter/material.dart';

class WorkoutListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Workouts'.toUpperCase()),
      ),
      body: Column(
        children: <Widget>[
          savedWorkoutItem({
            'key': '232s',
            'name': 'My first workout that spans at leas two lines'
          }),
          savedWorkoutItem({
            'key': '22s',
            'name': 'Another workout that spans at leas two lines'
          }),
          savedWorkoutItem({'key': '22s', 'name': 'spans at leas two lines'})
        ],
      ),
    );
  }
}
