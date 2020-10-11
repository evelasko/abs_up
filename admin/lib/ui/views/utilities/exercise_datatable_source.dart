import 'package:flutter/material.dart';

typedef OnRowSelect = void Function(int index);

class ExerciseDataTableSource extends DataTableSource {
  final List<Exercise> _exerciseData;
  final OnRowSelect onRowSelect;

  ExerciseDataTableSource({
    @required List<Exercise> exerciseData,
    @required this.onRowSelect,
  })  : _exerciseData = exerciseData,
        assert(exerciseData != null);

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= _exerciseData.length) {
      return null;
    }
    final _exercise = _exerciseData[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(_exercise.name)),
        DataCell(Text(_exercise.difficultyString)),
        DataCell(Text(_exercise.intensityString)),
        DataCell(Text(_exercise.target))
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _exerciseData.length;

  @override
  int get selectedRowCount => 0;

  // ignore: avoid_positional_boolean_parameters
  void sort<T>(Comparable<T> Function(Exercise d) getField, bool ascending) {
    _exerciseData.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    notifyListeners();
  }
}
