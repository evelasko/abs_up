import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/exercise.dart';
import '../../services/p_data.s.dart';
import '../widgets/exercises_blacklist_tabview.w.dart';
import '../widgets/exercises_exercises_tabview.w.dart';
import '../widgets/exercises_favorites_tabview.w.dart';

class ExercisesPage extends StatefulWidget {
  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage>
    with SingleTickerProviderStateMixin {
  final Box<Exercise> exercisesBox = PDataService.exercisesBox;
  final List<Tab> _tabList = <Tab>[
    const Tab(text: 'ALL'),
    const Tab(text: 'FAVORITES'),
    const Tab(text: 'BLACKLIST'),
    const Tab(text: 'NEW')
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabList,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: exercisesBox.listenable(),
        builder: (_, __, ___) => TabBarView(
          controller: _tabController,
          children: [
            ExercisesExercisesTabView(exercisesBox),
            ExercisesFavoritesTabView(exercisesBox),
            ExercisesBlacklistTabView(exercisesBox),
            const Center(
              child: Text('New Exercise'),
            )
          ],
        ),
      ),
      //        DefaultTabController(
      // length: 3,
      // child: Column(
      //   children: [
      // Container(
      //   padding: const EdgeInsets.only(top: 60, bottom: 20),
      //   child:
      //   TabBar(
      //     tabs: <Widget>[
      //       Text('Exercises'.toUpperCase(),
      //           style: AppTextStyles.tabHeader),
      //       Text('Favorites'.toUpperCase(),
      //           style: AppTextStyles.tabHeader),
      //       Text('Blacklist'.toUpperCase(),
      //           style: AppTextStyles.tabHeader)
      //     ],
      //     labelStyle: AppTextStyles.tabBarItem,
      //     labelPadding: const EdgeInsets.only(bottom: 15),
      //     indicatorColor: AppColors.coquelicot,
      //     indicatorWeight: 4,
      //   ),
      // ),
      //   Expanded(
      //     child:
      //   )
      // ],
      // )),
    );
  }
}
