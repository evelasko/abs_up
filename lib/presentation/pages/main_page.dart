import 'package:data_setup/domain/state/exercise_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/models/exercise.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final exercisesBox = Hive.box('exercises');
  List<ReactionDisposer> _disposers;
  ExerciseStore _exerciseStore;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _exerciseStore ??= Provider.of<ExerciseStore>(context);
    _disposers ??= [
      reaction((_) => _exerciseStore.errorMessage, (String message) {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text(message)));
      })
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          Container(
            height: 50,
            child: Observer(builder: (_) {
              switch (_exerciseStore.state) {
                case StoreState.initial:
                  return _buildMobxInitialTrigger();
                case StoreState.loading:
                  return CircularProgressIndicator();
                case StoreState.loaded:
                  return _buildMobxColumnWithData(_exerciseStore.exerciseList);
              }
            }),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _buildMobxInitialTrigger() => Center(
        child: RaisedButton(
            child: Text('Fetch exercises!'),
            onPressed: () => goFetchRemoteExerciseList(context)),
      );

  void goFetchRemoteExerciseList(BuildContext context) {
    final exerciseStore = Provider.of<ExerciseStore>(context);
    exerciseStore.getExerciseList();
  }

  Widget _buildMobxColumnWithData(List<Exercise> exerciseList) => ListTile(
        title: Text('Loaded: ${exerciseList.length} exercises!'),
      );

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
        id: 'any',
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
