import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/state/exercises_store.dart';
import '../theme/colors.t.dart';
import '../widgets/shared/exercise_items.w.dart';
import '../widgets/shared/filter_chip.w.dart';
import '../widgets/shared/filter_label.w.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({Key key}) : super(key: key);
  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  ExercisesStore _exercisesStore;
  TextEditingController _searchTextController;

  @override
  void didChangeDependencies() {
    _exercisesStore = Provider.of<ExercisesStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                title: const Text('Exercises'),
                //= Create exercise button
                // TODO implement user exercise creation
                //= Reset filters button
                // TODO implement a Clear Filters mechanism
                bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 85),
                  child: Container(
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            //= Search field
                            child: TextField(
                              cursorColor: AppColors.grey,
                              textAlignVertical: TextAlignVertical.center,
                              controller: _searchTextController,
                              onChanged: _exercisesStore.updateSearchString,
                              decoration: searchFieldDecoration,
                              style: const TextStyle(
                                  color: AppColors.grey, height: 0.8),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 32,
                            child: Row(
                              children: [
                                //= Items counter
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, right: 8),
                                  child: CounterChip(
                                      exercisesStore: _exercisesStore),
                                ),
                                Expanded(
                                  //= Filtering Row
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        const FilterLabel('tag'),
                                        FilterChipWidget(
                                          label: 'Favorites',
                                          selected:
                                              _exercisesStore.filterFavorites,
                                          onSelected: _exercisesStore
                                              .toggleFilterFavorites,
                                        ),
                                        FilterChipWidget(
                                          label: 'Blacklisted',
                                          selected:
                                              _exercisesStore.filterBlacklisted,
                                          onSelected: _exercisesStore
                                              .toggleFilterBlacklisted,
                                        ),
                                        const FilterLabel('equipment'),
                                        ..._exercisesStore.equipmentSet
                                            .map((e) => FilterChipWidget(
                                                label: e,
                                                selected: _exercisesStore
                                                    .equipmentFilter
                                                    .contains(e),
                                                onSelected: (_) =>
                                                    _exercisesStore
                                                        .updateEquipmentFilter(
                                                            e)))
                                            .toList(),
                                        const FilterLabel('sort by'),
                                        FilterChipWidget(
                                          label: 'Intensity',
                                          selected:
                                              _exercisesStore.sortByIntensity,
                                          onSelected: _exercisesStore
                                              .toggleSortByIntensity,
                                        ),
                                        FilterChipWidget(
                                          label: 'Difficulty',
                                          selected:
                                              _exercisesStore.sortByDifficulty,
                                          onSelected: _exercisesStore
                                              .toggleSortByDifficulty,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //= Exercise Items List
              SliverFixedExtentList(
                  delegate: SliverChildListDelegate(_exercisesStore.exercises
                      .map((exercise) => ExerciseItem(
                          key: Key('exerciseList:${exercise.key}'),
                          exercise: exercise))
                      .toList()),
                  itemExtent: 90.0)
            ],
          )
          //= Error widget
          ??
          const Center(child: Text('Error...')),
    );
  }
}

class CounterChip extends StatelessWidget {
  const CounterChip({
    Key key,
    @required ExercisesStore exercisesStore,
  })  : _exercisesStore = exercisesStore,
        super(key: key);

  final ExercisesStore _exercisesStore;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor: AppColors.greyDarkest,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.greyDark),
          borderRadius: BorderRadius.circular(20)),
      label: Text((_exercisesStore.exercises.length + 1).toString()),
      labelStyle:
          const TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500),
      onSelected: (_) {},
    );
  }
}

const InputDecoration searchFieldDecoration = InputDecoration(
  prefixIcon: Icon(Icons.search),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      borderSide: BorderSide(color: AppColors.greyDark)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  ),
);
