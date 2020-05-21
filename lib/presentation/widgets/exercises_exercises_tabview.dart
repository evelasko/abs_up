import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/models/exercise.dart';
import '../theme/colors.dart';
import 'shared/exercise_items.dart';
import 'shared/lists_empty_feedback.dart';

class ExercisesExercisesTabView extends StatefulWidget {
  final Box<Exercise> exerciseBox;

  const ExercisesExercisesTabView(this.exerciseBox, {Key key})
      : super(key: key);

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

  Widget showFiltersBar() => showFilters ? const Text('Filters') : Container();

  @override
  Widget build(BuildContext context) {
    final List<Exercise> exerciseList = searchString == null
        ? widget.exerciseBox.values.toList()
        : widget.exerciseBox.values
            .where((exercise) => exercise.name
                .contains(RegExp(searchString, caseSensitive: false)))
            .toList();
    if (exerciseList.isEmpty) return emptyListFeedbackExercises;
    return Column(
      children: <Widget>[
        Expanded(
          child: CustomScrollView(slivers: [
            /// Sliver Search Bar
            SliverAppBar(
              pinned: searchString != null,
              // ignore: avoid_redundant_argument_values
              leading: null,
              automaticallyImplyLeading: false,
              expandedHeight: 50.0,
              primary: false,
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: showFilters ? AppColors.rudy : AppColors.greyDark,
                    ),
                    onPressed: _toggleShowFilters)
              ],

              /// Search Bar
              title: Container(
                height: 30,
                margin: const EdgeInsets.only(right: 30),
                child: TextField(
                  // TODO the search mechanismo is not working properly... consider changing the method that triggers the search
                  onChanged: _updateSearchString,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      )),
                ),
              ),
              backgroundColor: AppColors.greyLightest,
            ),

            /// Sliver List
            SliverFixedExtentList(
              itemExtent: 90.0,
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => ExerciseItem(
                        key: Key('exerciseList:${exerciseList[index].key}'),
                        exercise: exerciseList[index],
                      ),
                  childCount: exerciseList.length),
            )
          ]),
        ),
        Container(
          height: 20,
        )
      ],
    );
  }
}
