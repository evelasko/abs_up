import 'package:data_setup/presentation/theme/colors.dart';

import 'shared/lists_empty_feedback.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/exercise.dart';
import '../../domain/repositories/i_hive_facade.dart';
import 'shared/exercise_items.dart';

class ExercisesExercisesTabView extends StatefulWidget {
  @override
  _ExercisesExercisesTabViewState createState() =>
      _ExercisesExercisesTabViewState();
}

class _ExercisesExercisesTabViewState extends State<ExercisesExercisesTabView> {
  String searchString;
  bool showFilters = false;

  /// State methods
  void _updateSearchString(String newSearchString) => setState(
      () => searchString = newSearchString.length > 3 ? newSearchString : null);
  void _toggleShowFilters() => setState(() => showFilters = !showFilters);

  Widget showFiltersBar() => showFilters
      ? Container(
          child: (Text('Filters')),
        )
      : Container();

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(slivers: [
                /// Sliver Search Bar
                SliverAppBar(
                  pinned: searchString != null,
                  leading: null,
                  automaticallyImplyLeading: false,
                  expandedHeight: 50.0,
                  primary: false,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.filter_list,
                          color:
                              showFilters ? AppColors.rudy : AppColors.greyDark,
                        ),
                        onPressed: _toggleShowFilters)
                  ],

                  /// Search Bar
                  title: Container(
                    height: 30,
                    margin: EdgeInsets.only(right: 30),
                    child: TextField(
                      expands: false,
                      maxLines: 1,
                      onChanged: _updateSearchString,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          )),
                    ),
                  ),
                  backgroundColor: AppColors.greyLightest,
                ),

                /// Sliver List
                ValueListenableBuilder(
                  valueListenable: IHiveFacade.exercisesBox.listenable(),
                  builder: (context, Box<Exercise> box, widget) {
                    final exercises = searchString == null
                        ? box.values.toList()
                        : box.values
                            .where((exercise) => exercise.name.contains(
                                RegExp(searchString, caseSensitive: false)))
                            .toList();

                    return SliverFixedExtentList(
                      itemExtent: 90.0,
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) =>
                              exercises.length == 0
                                  ? Container(
                                      child: Text('Nothing found...'),
                                    )
                                  : ExerciseItem(
                                      key: Key(
                                          'exerciseList:${exercises[index].key}'),
                                      exercise: exercises[index],
                                    ),
                          childCount:
                              exercises.length == 0 ? 1 : exercises.length),
                    );
                  },
                ),
              ]),
            ),
            Container(
              height: 20,
            )
          ],
        ),
      );
}
