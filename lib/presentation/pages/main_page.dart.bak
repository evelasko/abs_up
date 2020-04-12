import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/core/base_enums.dart';
import '../../domain/models/exercise.dart';
import '../../domain/repositories/i_hive_facade.dart';
import '../../domain/state/application_state.dart';
import '../../domain/state/exercise_store.dart';
import '../widgets/buttons.dart';
import '../widgets/items_exercise.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ReactionDisposer> _disposers;
  ApplicationStore _applicationStore;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _applicationStore ??= Provider.of<ApplicationStore>(context);
    _disposers ??= [
      reaction((_) => _applicationStore.errorMessage, (String message) {
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
        title: Text('AbsShuffler Setup'.toUpperCase()),
      ),
      body: Column(
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable:
                  IHiveFacade.userSettingsBox.listenable(keys: ['userId']),
              builder: (BuildContext context, Box<dynamic> box, Widget child) {
                print('listenable box: $box');
                print('values: ${box.values}');
                return Text(
                  box.values.toString(),
                  style: Theme.of(context).textTheme.headline5,
                );
              }),
          RaisedButton(
              child: Text('set name'),
              onPressed: () async =>
                  await IHiveFacade.userSettingsBox.put('userId', 'Scott')),
          Expanded(
            child: _buildExerciseList(),
          ),
          Divider(),
          Expanded(child: _buildExerciseListFromFirestore(context)),
          Divider(
            thickness: 2,
          ),
          RaisedButton(
            child: Text('Add to Favorites'),
            onPressed: _addExercise,
          ),
          Container(
            height: 50,
            child: Observer(builder: (_) {
              switch (_applicationStore.state) {
                case StoreState.initial:
                  return _buildMobxInitialTrigger();
                case StoreState.loading:
                  return CircularProgressIndicator();
                case StoreState.loaded:
                  return _buildMobxColumnWithData(
                      _applicationStore.exerciseList);
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

  Widget _buildMobxInitialTrigger() => Center(child: AppButtons.accentButton());

  void goFetchRemoteExerciseList(BuildContext context) {
    final exerciseStore = Provider.of<ExerciseStore>(context);
    exerciseStore.getExerciseList();
  }

  Widget _buildMobxColumnWithData(List<Exercise> exerciseList) => ListTile(
        title: Text('Loaded: ${exerciseList.length} exercises!'),
      );

  Widget _buildExerciseListFromFirestore(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('exercises').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return ListView(
            children: snapshot.data.documents.map((data) {
              final record = Record.fromSnapshot(data);
              return ListTile(
                title: Text(record.name),
                onTap: () => print(record),
              );
            }).toList(),
          );
        });
  }

  Widget _buildExerciseList() {
    return ValueListenableBuilder(
      valueListenable: IHiveFacade.exercisesBox.listenable(),
      builder: (context, Box<Exercise> box, widget) {
        print('list values: ${box.values.runtimeType}');
        box.keys.forEach((key) => print(key));
        // box.values.forEach((element) {
        //   print('element: $element.runtimeType');
        // });
        return ListView(
          children: box.keys
              .map((key) => ExerciseItem(
                  key: Key(key), exerciseId: key, exercise: box.get(key)))
              .toList(),
        );
        // return Text('Total Ex: ${IHiveFacade.exercisesBox.length}');
        //   return ListView.builder(
        //   itemCount: Hive.box('exercises').length,
        //   itemBuilder: (context, index) {
        //     final exercise =
        //         Hive.box('exercises').getAt(index); // exercisesBox.getAt(index);
        //     return ListTile(
        //       title: Text(exercise.name),
        //       subtitle: Text('Intensity: ${exercise.intensity}'),
        //       trailing: Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: <Widget>[
        //           IconButton(
        //               icon: Icon(Icons.refresh),
        //               onPressed: () => _updateExercise(index, exercise)),
        //           IconButton(
        //               icon: Icon(Icons.delete),
        //               onPressed: () => _deleteExercise(index))
        //         ],
        //       ),
        //     );
        //   },
        // )
      },
      child: Text('Nothing to show...'),
    );
  }

  void _addExercise() {
    print('Fetch new excercise');
    // Hive.box('exercises').add(Exercise(
    //     id: 'any',
    //     name: 'name',
    //     intensity: 1,
    //     difficulty: 1,
    //     target: 'target',
    //     equipment: 'equipment',
    //     weighted: false,
    //     sided: false));
  }
}

class Record {
  final String name;
  final int intensity;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['intensity'] != null),
        name = map['name'],
        intensity = map['intensity'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$intensity>";
}
