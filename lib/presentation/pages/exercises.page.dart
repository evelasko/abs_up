import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/theme/text.dart';
import 'package:flutter/material.dart';

import '../widgets/exercises_blacklist_tabview.dart';
import '../widgets/exercises_exercises_tabview.dart';
import '../widgets/exercises_favorites_tabview.dart';

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Exercises'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.filter_list), onPressed: () {})
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Text('Exercises'.toUpperCase()),
                Text('Favorites'.toUpperCase()),
                Text('Blacklist'.toUpperCase())
              ],
              labelStyle: AppTextStyles.tabBarItem,
              labelPadding: EdgeInsets.only(bottom: 15),
              indicatorColor: AppColors.rudy,
              indicatorWeight: 4,
            ),
          ),
          body: TabBarView(children: [
            ExercisesExercisesTabView(),
            ExercisesFavoritesTabView(),
            ExercisesBlacklistTabView()
          ])),
    );
  }
}
