import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:abs_up/presentation/theme/text.t.dart';
import 'package:abs_up/services/p_data.s.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../widgets/exercises_blacklist_tabview.dart';
import '../widgets/exercises_exercises_tabview.dart';
import '../widgets/exercises_favorites_tabview.dart';

class ExercisePage extends StatelessWidget {
  final Box<Exercise> exercisesBox = PDataService.exercisesBox;
  final GlobalKey<ScaffoldState> exercisesListPageScaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'exercisesListPageScaffoldKey');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          key: exercisesListPageScaffoldKey,
          appBar: AppBar(
            title: Text('Exercises'.toUpperCase(),
                style: const TextStyle(letterSpacing: 1)),
            actions: <Widget>[
              IconButton(icon: const Icon(Icons.filter_list), onPressed: () {})
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Text('Exercises'.toUpperCase(), style: AppTextStyles.tabHeader),
                Text('Favorites'.toUpperCase(), style: AppTextStyles.tabHeader),
                Text('Blacklist'.toUpperCase(), style: AppTextStyles.tabHeader)
              ],
              labelStyle: AppTextStyles.tabBarItem,
              labelPadding: const EdgeInsets.only(bottom: 15),
              indicatorColor: AppColors.coquelicot,
              indicatorWeight: 4,
            ),
          ),
          body: Provider(
            create: (_) => exercisesListPageScaffoldKey,
            child: ValueListenableBuilder(
                valueListenable: exercisesBox.listenable(),
                builder: (_, __, ___) => TabBarView(children: [
                      ExercisesExercisesTabView(exercisesBox),
                      ExercisesFavoritesTabView(exercisesBox),
                      ExercisesBlacklistTabView(exercisesBox),
                    ])),
          )),
    );
  }
}
