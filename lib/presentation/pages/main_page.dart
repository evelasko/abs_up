import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/exercise.dart';

class MainPage extends StatelessWidget {
  final exercisesBox = Hive.box('exercises');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abs App Data Setup'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildExerciseList(),
          ),
          Divider(
            thickness: 2,
          ),
          RaisedButton(
            child: Text('Add New Excercise'),
            onPressed: _addExercise,
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _buildExerciseList() {
    return ValueListenableBuilder(
      valueListenable: exercisesBox.listenable(),
      builder: (context, box, widget) => ListView.builder(
        itemCount: exercisesBox.length,
        itemBuilder: (context, index) {
          final exercise = exercisesBox.getAt(index);
          return ListTile(
            title: Text(exercise.name),
            subtitle: Text('Intensity: ${exercise.intensity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () => _updateExercise(index, exercise)),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteExercise(index))
              ],
            ),
          );
        },
      ),
      child: Text('Nothing to show...'),
    );
  }

  void _addExercise() {
    print('Fetch new excercise');
    Hive.box('exercises').add(Exercise(
        name: 'name',
        intensity: 1,
        difficulty: 1,
        target: 'target',
        equipment: 'equipment',
        weighted: false,
        sided: false));
  }

  void _updateExercise(int index, Exercise exercise) {
    exercisesBox.putAt(index, Exercise(name: exercise.name + '*'));
  }

  void _deleteExercise(int index) {
    exercisesBox.deleteAt(index);
  }
}
