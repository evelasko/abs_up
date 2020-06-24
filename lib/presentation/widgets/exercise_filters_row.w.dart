import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants.dart';
import '../../domain/state/exercises_store.dart';
import '../../injection.dart';
import 'shared/filter_chip.w.dart';
import 'shared/filter_label.w.dart';

class ExerciseFiltersRow extends StatefulWidget {
  const ExerciseFiltersRow({
    Key key,
  }) : super(key: key);

  @override
  _ExerciseFiltersRowState createState() => _ExerciseFiltersRowState();
}

class _ExerciseFiltersRowState extends State<ExerciseFiltersRow> {
  @override
  Widget build(BuildContext context) {
    final ExercisesStore _exercisesStore = getIt.get<ExercisesStore>();
    return Observer(
      builder: (_) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            const FilterLabel('tag'),
            FilterChipWidget(
                label: 'Show All', selected: false, onSelected: (_) {}),
            FilterChipWidget(
                label: 'Favorites', selected: false, onSelected: (_) {}),
            FilterChipWidget(
                label: 'Blacklisted', selected: false, onSelected: (_) {}),
            const FilterLabel('equipment'),
            ...EQUIPMENT_DATA_KEYS
                .map((e) => FilterChipWidget(
                    label: EQUIPMENT_TEXT[e],
                    selected: _exercisesStore.equipmentFilter.contains(e),
                    onSelected: (_) =>
                        _exercisesStore.updateEquipmentFilter(e)))
                .toList(),
            const FilterLabel('sort by intensity'),
            const FilterLabel('sort by difficulty'),
          ],
        ),
      ),
    );
  }
}
